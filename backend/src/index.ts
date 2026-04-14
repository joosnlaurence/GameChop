import 'dotenv/config'
import express from 'express';
import gamesRouter from './routes/games';
import publishersRouter from './routes/publishers';
import usersRouter from './routes/users';

const app = express();

app.use(express.json());

app.use('/api/games', gamesRouter);
app.use('/api/publishers', publishersRouter);
app.use('/api/users', usersRouter);

app.get('/', async (req, res) => {
  res.json({'message': 'Hello, world!'});
});

const server = app.listen(3000, () => {
  console.log('Server ready at : http://localhost:3000');
})