import { Router, Request, Response } from 'express';
import pool from '../db';

const router = Router();

// GET /api/users/:id/library
// Returns all games a user owns or wishlisted, with optional filtering.
// Supports query params: search, genre, publisher, developer, sortBy
router.get('/:id/library', async (req: Request, res: Response) => {
    const { id } = req.params;
    const { search, genre, publisher, developer, sortBy } = req.query;
    try {
        // Join with game_listing to enable genre/publisher/developer filtering
        let query = `
            SELECT
                ul.user_id, ul.username, ul.game_id, ul.title, ul.thumbnail, ul.price,
                ul.purchased, ul.wishlisted, ul.total_achievements, ul.earned_achievements
            FROM user_library ul
            JOIN game_listing gl ON ul.game_id = gl.game_id
            WHERE ul.user_id = ?
        `;
        const params: any[] = [id];

        if (search) {
            query += ` AND ul.title LIKE ?`;
            params.push(`%${search}%`);
        }
        if (genre) {
            query += ` AND FIND_IN_SET(?, gl.genres)`;
            params.push(genre);
        }
        if (publisher) {
            query += ` AND FIND_IN_SET(?, gl.publishers)`;
            params.push(publisher);
        }
        if (developer) {
            query += ` AND FIND_IN_SET(?, gl.developers)`;
            params.push(developer);
        }

        if (sortBy === 'alpha')           query += ` ORDER BY ul.title ASC`;
        else if (sortBy === 'price_asc')  query += ` ORDER BY ul.price ASC`;
        else if (sortBy === 'price_desc') query += ` ORDER BY ul.price DESC`;

        const [rows]: any = await pool.query(query, params);

        // Split owned vs wishlisted so frontend can render two separate sections easily
        const owned      = rows.filter((r: any) => r.purchased);
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

// POST /api/users/:id/achievements/toggle
// Body: { gameId, achievementId } — flips achieved state
router.post('/:id/achievements/toggle', async (req: Request, res: Response) => {
  const { id } = req.params;
  const { gameId, achievementId } = req.body;

  if (!gameId || !achievementId) {
    return res.status(400).json({ error: 'gameId and achievementId are required' });
  }

  try {
    const [rows]: any = await pool.query(
      `SELECT achieved FROM user_achievements
       WHERE user_id = ? AND game_id = ? AND achievement_id = ?`,
      [id, gameId, achievementId]
    );

    const currentlyAchieved = rows.length > 0 && !!rows[0].achieved;
    const newState = !currentlyAchieved;

    await pool.query(
      `INSERT INTO user_achievements (user_id, game_id, achievement_id, achieved)
       VALUES (?, ?, ?, ?)
       ON DUPLICATE KEY UPDATE achieved = ?`,
      [id, gameId, achievementId, newState, newState]
    );

    res.json({ achieved: newState });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to toggle achievement' });
  }
});

// POST /api/users/:id/wishlist
// Adds a game to a user's wishlist.
/* If the game is already in user_games (owned or wishlisted), 
just sets wishlisted = TRUE without duplicating. */
router.post('/:id/wishlist', async (req: Request, res: Response) => {
    const { id } = req.params;
    const { gameId } = req.body;

    if (!gameId) {
        return res.status(400).json({ error: 'gameId is required' });
    }

    try {
        // INSERT IGNORE skips if (user_id, game_id) already exists
        await pool.query(
            `INSERT IGNORE INTO user_games (user_id, game_id, purchased, wishlisted)
             VALUES (?, ?, FALSE, TRUE)`,
            [id, gameId]
        );

        // UPDATE handles the case where the row already existed
        // (eg they own the game but want to rewishlist it)
        await pool.query(
            `UPDATE user_games SET wishlisted = TRUE
             WHERE user_id = ? AND game_id = ?`,
            [id, gameId]
        );

        res.status(201).json({ message: 'Game added to wishlist' });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Failed to add to wishlist' });
    }
});

// DELETE /api/users/:id/wishlist/:gameId
// Removes a game from a user's wishlist.
router.delete('/:id/wishlist/:gameId', async (req: Request, res: Response) => {
    const { id, gameId } = req.params;
    try {
        await pool.query(
            `UPDATE user_games SET wishlisted = FALSE WHERE user_id = ? AND game_id = ?`,
            [id, gameId]
        );
        res.json({ message: 'Game removed from wishlist' });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Failed to remove from wishlist' });
    }
});

export default router;