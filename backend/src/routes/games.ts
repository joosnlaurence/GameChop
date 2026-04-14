import { Router, Request, Response } from 'express';
import pool from '../db'; // your mysql2 connection pool
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

// GET /api/games
// General game listing for catalog pages
router.get('/', async (req: Request, res: Response) => {
    try {
        const { genre, publisher, developer, search } = req.query;

        let query = `SELECT * FROM game_listing WHERE 1=1`;
        const params: any[] = [];

        // FIND_IN_SET checks inside the comma-separated
        // GROUP_CONCAT string the view produces
        if (genre) {
            query += ` AND FIND_IN_SET(?, genres)`;
            params.push(genre);
        }
        if (publisher) {
            query += ` AND FIND_IN_SET(?, publishers)`;
            params.push(publisher);
        }
        if (developer) {
            query += ` AND FIND_IN_SET(?, developers)`;
            params.push(developer);
        }
        if (search) {
            query += ` AND title LIKE ?`;
            params.push(`%${search}%`);
        }

        const [rows] = await pool.query<GameListingRow[]>(query, params);

        const games = rows.map((row) => ({
          ...row,
          genres: row.genres?.split(', ') ?? [],
          publishers: row.publishers?.split(', ') ?? [],
          developers: row.developers?.split(', ') ?? []
        }));

        res.json(games);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Failed to fetch games' });
    }
});

// GET /api/games/:id
// Full game details page data.
/* Returns game info + publisher + developer + achievements + previews + hardware reqs
all in one response object. */

interface GameDetailsRow {
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

router.get('/:id', async (req: Request, res: Response) => {
    const { id } = req.params;
    try {
        // Base game info from the view
        const [gameRows]: any = await pool.query(
            `SELECT * FROM game_details WHERE game_id = ?`,
            [id]
        );

        if (!gameRows.length) {
            return res.status(404).json({ error: 'Game not found' });
        }

        // clean up the game object to send to client
        const game: GameDetailsRow = {
          ...gameRows[0],
          // purchased,
          genres: gameRows[0]?.genres.split(', ') ?? [],
          publishers: gameRows[0]?.publishers.split(', ') ?? [],
          developers: gameRows[0]?.developers.split(', ') ?? []
        }

        // Achievements for this game
        const [achievements]: any = await pool.query(
            `SELECT a.id, a.title, a.description
             FROM achievements a
             JOIN game_achievements ga ON a.id = ga.achievement_id
             WHERE ga.game_id = ?`,
            [id]
        );

        // Preview URLs for this game
        const [previews]: any = await pool.query(
            `SELECT preview_id, url
             FROM game_previews
             WHERE game_id = ?
             ORDER BY preview_id`,
            [id]
        );

        // Hardware requirements (min and recommended)
        const [requirements]: any = await pool.query(
            `SELECT r.id, r.os, r.cpu, r.mem, r.gpu, r.storage,
                    gr.recommended
             FROM requirements r
             JOIN game_requirements gr ON r.id = gr.req_id
             WHERE gr.game_id = ?`,
            [id]
        );

        // Combine everything into one response object
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
        res.status(500).json({ error: 'Failed to fetch game details' });
    }
});

export default router;