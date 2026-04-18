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

const parseGameRow = (row: GameListingRow) => ({
    ...row,
    genres:     row.genres?.split(',').map(s => s.trim())     ?? [],
    publishers: row.publishers?.split(',').map(s => s.trim()) ?? [],
    developers: row.developers?.split(',').map(s => s.trim()) ?? []
});

// GET /api/publishers/featured
router.get('/featured', async (_req: Request, res: Response) => {
    try {
        const [rows]: any = await pool.query(
            `SELECT
                p.id,
                p.name,
                p.logo,
                p.banner,
                COUNT(pg.game_id) AS game_count
             FROM publishers p
             LEFT JOIN publisher_games pg ON p.id = pg.publisher_id
             GROUP BY p.id, p.name, p.logo, p.banner
             ORDER BY game_count DESC
             LIMIT 4`
        );
        res.json(rows);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Failed to fetch publishers' });
    }
});

// GET /api/publishers/:id/games
// Publisher detail page - shows ALL games from this publisher
router.get('/:id/games', async (req: Request, res: Response) => {
    const { id } = req.params;
    try {
        const [rows] = await pool.query<GameListingRow[]>(
            `SELECT gl.*
             FROM game_listing gl
             JOIN publisher_games pg ON gl.game_id = pg.game_id
             WHERE pg.publisher_id = ?`,
            [id]
        );
        res.json(rows.map(parseGameRow));
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Failed to fetch publisher games' });
    }
});

// GET /api/publishers/:id/more-games
// "More from this publisher" feature - returns 4 games excluding the current one
router.get('/:id/more-games', async (req: Request, res: Response) => {
    const { id } = req.params;
    const excludeId = req.query.excludeId as string;
    const limit = 4; // Locked at 4 as required

    try {
        let query = `
            SELECT gl.*
            FROM game_listing gl
            JOIN publisher_games pg ON gl.game_id = pg.game_id
            WHERE pg.publisher_id = ?`;
        const params: any[] = [id];

        if (excludeId) {
            query += ` AND gl.game_id != ?`;
            params.push(excludeId);
        }

        query += ` LIMIT ?`;
        params.push(limit);

        const [rows] = await pool.query<GameListingRow[]>(query, params);
        res.json(rows.map(parseGameRow));
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Failed to fetch more games from this publisher' });
    }
});

export default router;