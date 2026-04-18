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
// Place an order for one or more games. All items share a single order_num.
router.post('/', async (req: Request, res: Response) => {
    const { userId, items } = req.body;

    // Basic validation
    if (!userId || !Array.isArray(items) || items.length === 0) {
        return res.status(400).json({ error: 'userId and items[] are required' });
    }
    for (const item of items) {
        if (!item.gameId || !item.copies || item.copies < 1) {
            return res.status(400).json({ error: 'Each item needs gameId and copies >= 1' });
        }
        if (!item.isDigital && !item.storeId) {
            return res.status(400).json({ error: 'Physical items require a storeId' });
        }
    }

    const connection = await (pool as any).getConnection();
    try {
        await connection.beginTransaction();

        const [maxRows]: any = await connection.query(
            `SELECT COALESCE(MAX(order_id), 0) AS max_id FROM orders`
        );
        const nextOrderId = maxRows[0].max_id + 1;
        const orderNum = `GC-${String(nextOrderId).padStart(5, '0')}`;

        const insertedOrderIds: number[] = [];

        for (const item of items) {
            const { gameId, storeId, copies, isDigital } = item;

            // Insert the order row with the shared order_num
            const [result]: any = await connection.query(
                `INSERT INTO orders (user_id, game_id, store_id, copies, is_digital, order_num)
                 VALUES (?, ?, ?, ?, ?, ?)`,
                [userId, gameId, storeId || null, copies, isDigital, orderNum]
            );
            insertedOrderIds.push(result.insertId);

            // Mark as purchased in user_games
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
        }

        await connection.commit();
        res.status(201).json({
            message: 'Order placed successfully',
            orderNum,
            orderIds: insertedOrderIds,
        });
    } catch (err) {
        await connection.rollback();
        console.error(err);
        res.status(500).json({ error: 'Failed to place order' });
    } finally {
        connection.release();
    }
});

export default router;