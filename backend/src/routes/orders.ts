import { Router, Request, Response } from 'express';
import pool from '../db';

const router = Router();

// GET /api/orders/user/:userId
// All orders placed by a specific user,with game title and store info included.
// Uses the user_purchase_history view.
router.get('/user/:userId', async (req: Request, res: Response) => {
    const { userId } = req.params;
    try {
        const [rows]: any = await pool.query(
            `SELECT * FROM user_purchase_history
             WHERE user_id = ?
             ORDER BY ordered_at DESC`,
            [userId]
        );
        res.json(rows);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Failed to fetch orders' });
    }
});

// POST /api/orders
// Place a new order for a game.
// Body: { userId, gameId, storeId, copies, isDigital }
// Generates readable order_num like GC-00042.
// Also marks the game as purchased in user_games.
// If physical decrements store inventory.
router.post('/', async (req: Request, res: Response) => {
    const { userId, gameId, storeId, copies, isDigital } = req.body;

    // Basic validation
    if (!userId || !gameId || copies < 1) {
        return res.status(400).json({ error: 'Missing required fields' });
    }
    if (!isDigital && !storeId) {
        return res.status(400).json({ error: 'Physical orders require a storeId' });
    }

    const connection = await (pool as any).getConnection();
    try {
        // Use a transaction so if any step fails,
        // nothing is partially committed to the database
        await connection.beginTransaction();

        // Insert the order
        const [result]: any = await connection.query(
            `INSERT INTO orders (user_id, game_id, store_id, copies, is_digital)
             VALUES (?, ?, ?, ?, ?)`,
            [userId, gameId, storeId || null, copies, isDigital]
        );

        const orderId = result.insertId;

        // Generate readable order number e.g. GC-00042
        const orderNum = `GC-${String(orderId).padStart(5, '0')}`;
        await connection.query(
            `UPDATE orders SET order_num = ? WHERE order_id = ?`,
            [orderNum, orderId]
        );

        // Mark game as purchased in user_games.
        // INSERT IGNORE skips if row already exists (eg was wishlisted).
        // Then UPDATE sets purchased to TRUE either way.
        await connection.query(
            `INSERT IGNORE INTO user_games (user_id, game_id, purchased, wishlisted)
             VALUES (?, ?, TRUE, FALSE)`,
            [userId, gameId]
        );
        await connection.query(
            `UPDATE user_games SET purchased = TRUE
             WHERE user_id = ? AND game_id = ?`,
            [userId, gameId]
        );

        // Decrement physical store inventory if applicable
        if (!isDigital && storeId) {
            await connection.query(
                `UPDATE store_games
                 SET copies = copies - ?
                 WHERE store_id = ? AND game_id = ?`,
                [copies, storeId, gameId]
            );
        }

        await connection.commit();
        res.status(201).json({
            message:  'Order placed successfully',
            orderId,
            orderNum
        });
    } catch (err) {
        // If anything fails roll back all changes
        await connection.rollback();
        console.error(err);
        res.status(500).json({ error: 'Failed to place order' });
    } finally {
        connection.release();
    }
});

export default router;