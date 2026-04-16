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

const app = express();

// for whatever reason, data from DB would not show up
// unless I added this ¯\_(ツ)_/¯
app.use(cors({
  origin: 'http://localhost:5173',
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

app.get('/', async (req, res) => {
  res.json({'message': 'Hello, world!'});
});

const server = app.listen(3000, () => {
  console.log('Server ready at : http://localhost:3000');
})