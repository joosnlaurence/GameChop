import { Router, Request, Response } from 'express';
import pool from '../db';
import { RowDataPacket } from 'mysql2';

const router = Router();

interface GameListingRow extends RowDataPacket {
    game_id: number;
    title: string;
    summary: string;
    thumbnail: string;
    release_date: string;
    price: number;
    genres: string;
    publishers: string;
    developers: string;
}

interface GameDetailsRow {
    game_id: number;
    title: string;
    summary: string;
    thumbnail: string;
    release_date: string;
    price: number;
    genres: string | string[];
    publishers: string | string[];
    developers: string | string[];
}

// reused across routes to split GROUP_CONCAT strings from views into proper arrays
const parseGameRow = (row: GameListingRow) => ({
    ...row,
    genres:     row.genres?.split(',').map(s => s.trim())     ?? [],
    publishers: row.publishers?.split(',').map(s => s.trim()) ?? [],
    developers: row.developers?.split(',').map(s => s.trim()) ?? []
});

// GET /api/games/filters
// Returns distinct genres, publishers, and developers for populating filter dropdowns.
router.get('/filters', async (_req: Request, res: Response) => {
    try {
        const [genres]     = await pool.query('SELECT DISTINCT name FROM genres ORDER BY name');
        const [publishers] = await pool.query('SELECT DISTINCT name FROM publishers ORDER BY name');
        const [developers] = await pool.query('SELECT DISTINCT name FROM developers ORDER BY name');
        res.json({
            genres:     (genres     as any[]).map((r) => r.name),
            publishers: (publishers as any[]).map((r) => r.name),
            developers: (developers as any[]).map((r) => r.name),
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Failed to fetch filter options' });
    }
});

// GET /api/games/new-releases
// 8 most recently released games.
router.get('/new-releases', async (_req: Request, res: Response) => {
    try {
        const [rows] = await pool.query<GameListingRow[]>(
            `SELECT * FROM game_listing
             ORDER BY release_date DESC
             LIMIT 8`
        );
        res.json(rows.map(parseGameRow));
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Failed to fetch new releases' });
    }
});

// GET /api/games/popular
// Top 8 games ranked by total order count.
router.get('/popular', async (_req: Request, res: Response) => {
    try {
        const [rows] = await pool.query<GameListingRow[]>(
            `SELECT gl.*, COUNT(o.game_id) AS order_count
             FROM game_listing gl
             LEFT JOIN orders o ON gl.game_id = o.game_id
             GROUP BY
                gl.game_id, gl.title, gl.summary, gl.thumbnail,
                gl.release_date, gl.price, gl.genres,
                gl.publishers, gl.developers
             ORDER BY order_count DESC, gl.release_date DESC
             LIMIT 8`
        );
        res.json(rows.map(parseGameRow));
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Failed to fetch popular games' });
    }
});

// GET /api/games
// Paginated game listing with optional filters and sorting.
router.get('/', async (req: Request, res: Response) => {
    try {
        const { genre, publisher, developer, search, sortBy } = req.query;

        // Pagination — default page 1, 20 per page, max 50
        const page   = Math.max(1, parseInt(req.query.page  as string) || 1);
        const limit  = Math.min(50, parseInt(req.query.limit as string) || 20);
        const offset = (page - 1) * limit;

        let baseWhere = `WHERE 1=1`;
        const params: any[] = [];

        if (genre) {
            baseWhere += ` AND EXISTS (
                SELECT 1 FROM game_genres gg
                JOIN genres ge ON gg.genre_id = ge.id
                WHERE gg.game_id = gl.game_id AND ge.name = ?
            )`;
            params.push(genre);
        }
        if (publisher) {
            baseWhere += ` AND EXISTS (
                SELECT 1 FROM publisher_games pg
                JOIN publishers p ON pg.publisher_id = p.id
                WHERE pg.game_id = gl.game_id AND p.name = ?
            )`;
            params.push(publisher);
        }
        if (developer) {
            baseWhere += ` AND EXISTS (
                SELECT 1 FROM developer_games dg
                JOIN developers d ON dg.developer_id = d.id
                WHERE dg.game_id = gl.game_id AND d.name = ?
            )`;
            params.push(developer);
        }
        if (search) {
            baseWhere += ` AND title LIKE ?`;
            params.push(`%${search}%`);
        }

        let orderClause = '';
        if (sortBy === 'alpha')            orderClause = ` ORDER BY title ASC`;
        else if (sortBy === 'price_asc')   orderClause = ` ORDER BY price ASC`;
        else if (sortBy === 'price_desc')  orderClause = ` ORDER BY price DESC`;
        else if (sortBy === 'newest')      orderClause = ` ORDER BY release_date DESC`;

        // Total count for pagination metadata
        const [countRows]: any = await pool.query(
            `SELECT COUNT(*) AS total FROM game_listing gl ${baseWhere}`,
            params
        );
        const total = countRows[0].total;

        const [rows] = await pool.query<GameListingRow[]>(
            `SELECT gl.* FROM game_listing gl ${baseWhere}${orderClause} LIMIT ? OFFSET ?`,
            [...params, limit, offset]
        );

        res.json({
            data: rows.map(parseGameRow),
            pagination: {
                page,
                limit,
                total,
                totalPages: Math.ceil(total / limit)
            }
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Failed to fetch games' });
    }
});

// GET /api/games/:id
// Full game details — info, publisher, developer, achievements, previews, hardware requirements.
router.get('/:id', async (req: Request, res: Response) => {
    const { id } = req.params;
    try {
        const [gameRows]: any = await pool.query(
            `SELECT * FROM game_details WHERE game_id = ?`,
            [id]
        );

        if (!gameRows.length) {
            return res.status(404).json({ error: 'Game not found' });
        }

        const game: GameDetailsRow = {
            ...gameRows[0],
            genres:     gameRows[0]?.genres?.split(',')     ?? [],
            publishers: gameRows[0]?.publishers?.split(',') ?? [],
            developers: gameRows[0]?.developers?.split(',') ?? []
        };

        const [achievements]: any = await pool.query(
            `SELECT a.id, a.title, a.description
             FROM achievements a
             JOIN game_achievements ga ON a.id = ga.achievement_id
             WHERE ga.game_id = ?`,
            [id]
        );

        const [previews]: any = await pool.query(
            `SELECT preview_id, url
             FROM game_previews
             WHERE game_id = ?
             ORDER BY preview_id`,
            [id]
        );

        const [requirements]: any = await pool.query(
            `SELECT r.id, r.os, r.cpu, r.mem, r.gpu, r.storage,
                    gr.recommended
             FROM requirements r
             JOIN game_requirements gr ON r.id = gr.req_id
             WHERE gr.game_id = ?`,
            [id]
        );

        res.json({
            ...game,
            achievements,
            previews,
            requirements: {
                minimum:     requirements.find((r: any) => !r.recommended) || null,
                recommended: requirements.find((r: any) =>  r.recommended) || null
            }
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Failed to fetch game details' });
    }
});

// GET /api/games/:id/similar
// Up to 4 games sharing the most genres with the selected game.
router.get('/:id/similar', async (req: Request, res: Response) => {
    const { id } = req.params;
    try {
        const [rows] = await pool.query<GameListingRow[]>(
            `SELECT gl.*, COUNT(gg2.genre_id) AS shared_genres
             FROM game_genres gg1
             JOIN game_genres gg2 ON gg1.genre_id = gg2.genre_id
                                 AND gg2.game_id != ?
             JOIN game_listing gl ON gg2.game_id  = gl.game_id
             WHERE gg1.game_id = ?
             GROUP BY
                gl.game_id, gl.title, gl.summary, gl.thumbnail,
                gl.release_date, gl.price, gl.genres,
                gl.publishers, gl.developers
             ORDER BY shared_genres DESC
             LIMIT 4`,
            [id, id]
        );
        res.json(rows.map(parseGameRow));
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Failed to fetch similar games' });
    }
});

export default router;