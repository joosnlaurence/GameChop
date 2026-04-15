import { Router, Request, Response } from 'express';
import pool from '../db';

const router = Router();

// GET /api/users/:id/library
// Returns all games a user owns or wishlisted
// with achievement progress counts per game
router.get('/:id/library', async (req: Request, res: Response) => {
    const { id } = req.params;
    try {
        const [rows]: any = await pool.query(
            `SELECT * FROM user_library WHERE user_id = ?`,
            [id]
        );

        // Split owned vs wishlisted so frontend
        // can render two separate sections easily
        const owned     = rows.filter((r: any) => r.purchased);
        const wishlisted = rows.filter((r: any) => r.wishlisted && !r.purchased);

        res.json({ owned, wishlisted });
    } catch (err) {
        res.status(500).json({ error: 'Failed to fetch library' });
    }
});

// GET /api/users/:id/library/:gameId/achievements
// Detailed achievement list for one game in a user's library, showing which ones they've earned and which they haven't
router.get('/:id/library/:gameId/achievements', async (req: Request, res: Response) => {
    const { id, gameId } = req.params;
    try {
        const [rows]: any = await pool.query(
            `SELECT
                a.id            AS achievement_id,
                a.title,
                a.description,
                COALESCE(ua.achieved, FALSE) AS achieved
             FROM achievements a
             JOIN game_achievements ga   ON a.id  = ga.achievement_id
                                        AND ga.game_id = ?
             LEFT JOIN user_achievements ua ON a.id  = ua.achievement_id
                                           AND ua.user_id  = ?
                                           AND ua.game_id  = ?`,
            [gameId, id, gameId]
        );

        res.json(rows);
    } catch (err) {
        res.status(500).json({ error: 'Failed to fetch achievements' });
    }
});

export default router;