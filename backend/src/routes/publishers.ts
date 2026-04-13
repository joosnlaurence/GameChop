import { Router, Request, Response } from 'express';
import pool from '../db';

const router = Router();

// GET /api/publishers/featured
/* Returns all publishers for the home page featured section. Includes a count of how many 
games they have so the frontend can display "23 games" under each publisher logo */
router.get('/featured', async (req: Request, res: Response) => {
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
             ORDER BY game_count DESC`
        );

        res.json(rows);
    } catch (err) {
        res.status(500).json({ error: 'Failed to fetch publishers' });
    }
});

// GET /api/publishers/:id/games
// All games for a specific publisher page.
// Uses game_listing view for consistent shape
router.get('/:id/games', async (req: Request, res: Response) => {
    const { id } = req.params;
    try {
        const [rows]: any = await pool.query(
            `SELECT gl.*
             FROM game_listing gl
             JOIN publisher_games pg ON gl.game_id = pg.game_id
             WHERE pg.publisher_id = ?`,
            [id]
        );

        res.json(rows);
    } catch (err) {
        res.status(500).json({ error: 'Failed to fetch publisher games' });
    }
});

export default router;