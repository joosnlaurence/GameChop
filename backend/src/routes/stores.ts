import { Router, Request, Response } from 'express';
import pool from '../db';
import { RowDataPacket } from 'mysql2';


const router = Router();

interface StoreRow extends RowDataPacket
{
    id: number;
    address: string;
    city: string;
    state: string;
    open_hour: string;
    close_hour: string;
    google_map_url: string;
}

router.get('/', async (req: Request, res: Response) => 
{
    try
    {
        const { city, state } = req.query;

        let query = `SELECT * FROM stores WHERE 1=1`;
        const params: any[] = [];

        if(city)
        {
            query += `AND city = ?`;
            params.push(city);
        }
        if(state)
        {
            query += `AND state = ?`;
            params.push(state);
        }

        const [rows] = await pool.query<StoreRow[]>(query, params);
        res.json(rows);
    }
    catch(err)
    {
        console.error(err);
        res.status(500).json({error: 'Failed to fetch stores'});
    }
});

router.get('/:id', async (req: Request, res: Response) =>
{
    const { id } = req.params;
    try
    {
        const [rows] = await pool.query<StoreRow[]>(`SELECT * FROM stores WHERE id = ?`, [id]);
        if(!rows.length)
        {
            return res.status(404).json({error: 'Store not found'});
        }

        res.json(rows[0]);
    }
    catch(err)
    {
        console.error(err);
        res.status(500).json({error: 'Failed to fetch store'});
    }
});

export default router;