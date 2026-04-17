import 'dotenv/config'
import express from 'express';
import cookieParser from 'cookie-parser';

import authRouter from './routes/auth';
import gamesRouter from './routes/games';
import publishersRouter from './routes/publishers';
import usersRouter from './routes/users';
import storesRouter from './routes/stores';
import ordersRouter from './routes/orders';
import cors from 'cors';
import path from 'path';

const app = express();

// for whatever reason, data from DB would not show up
// unless I added this ¯\_(ツ)_/¯
app.use(cors({
  origin: '*',
  credentials: true
}))

app.use(express.json());
app.use(cookieParser());

app.use('/auth', authRouter);

app.use('/api/games', gamesRouter);
app.use('/api/publishers', publishersRouter);
app.use('/api/users', usersRouter);
app.use('/api/stores', storesRouter);
app.use('/api/orders', ordersRouter);

app.use(express.static(path.join(__dirname, '../public')));
app.get('/{*path}', (req, res) => {
  res.sendFile(path.join(__dirname, '../public/index.html'));
})

const server = app.listen(3000, () => {
  console.log('Server ready at : http://localhost:8080');
})