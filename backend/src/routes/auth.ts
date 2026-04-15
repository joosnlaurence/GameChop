import { Router, Request, Response } from 'express';
import pool from '../db';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { AuthRequest, requireAuth } from '../middleware/auth.middleware';

const router = Router();
const JWT_SECRET = process.env.JWT_SECRET!;

interface UserRow {
  id: number;
  username: string;
  password_hash: string;
  created_at: string;
}

router.post('/signup', async (req: Request, res: Response) => {
  const { username, password } = req.body;

  try {
    const [existing] = await pool.query(
      `SELECT * FROM users WHERE username = ?`,
      [username]
    );

    if((existing as UserRow[]).length > 0) {
      res.status(409).json({ message: 'Username already taken' });
    }

    const hash = await bcrypt.hash(password, 10);

    await pool.query(
      'INSERT INTO users (username, password_hash) VALUES (?, ?)',
      [username, hash]
    );

    res.status(201).json({ message: 'Account created!' });
  } catch(err) {
    console.error(err);
    res.status(500).json({ message: 'User sign up failed...' })
  }
});

router.post('/login', async (req: Request, res: Response) => {
  const { username, password } = req.body;

  try {
    const [rows] = await pool.query(
      'SELECT * FROM users WHERE username = ?',
      [username]
    );

    const user = (rows as UserRow[])[0];
    
    if(!user){
      res.status(401).json({ message: 'Invalid username or password' })
      return;
    }

    const valid = await bcrypt.compare(password, user.password_hash);

    if(!valid) {
      res.status(401).json({ message: 'Invalid username or password' })
      return;
    }

    const token = jwt.sign({ userId: user.id }, JWT_SECRET, { expiresIn: '7d' });

    res.cookie('token', token, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'strict',
      maxAge: 7 * 24 * 60 * 60 * 1000
    })

    res.json({ id: user.id, message: 'User logged in' });
  } catch(err) {
    console.error(err);
    res.status(500).json({ id: -1, message: 'Unknown server error occurred' });
  }
})

router.get('/me', requireAuth, async (req: AuthRequest, res: Response) => {
  const [rows] = await pool.query(
    'SELECT id, username FROM users WHERE id = ?',
    [req.userId]
  );

  const user = (rows as UserRow[])[0];

  if (!user) {
    res.status(401).json({ id: -1, message: 'Unauthorized' });
    return;
  }

  res.json({ id: user.id, username: user.username });
});

router.post('/logout', async (req: AuthRequest, res: Response) => {
  res.clearCookie('token');
  res.json({ message: 'Logged out' });
});

export default router;