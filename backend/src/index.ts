import express from 'express';

const app = express();

app.use(express.json());

app.get('/', async (req, res) => {
  res.json({'message': 'Hello, world!'});
});

const server = app.listen(3000, () => {
  console.log('Server ready at : http://localhost:3000');
})