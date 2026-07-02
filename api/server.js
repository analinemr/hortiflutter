const express = require('express');
const cors = require('cors');
const userRoutes = require('./routes/userRoutes');

const app = express();

app.use(cors());
app.use(express.json());

app.use('/usuarios', userRoutes);

app.get('/', (req, res) => {
    res.send('API funcionando');
});

app.listen(3000, () => {
    console.log('Servidor rodando na porta 3000');
});