const express = require('express');
const morgan = require('morgan');
const cors = require('cors');
const path = require('path');
const bodyParser = require('body-parser');
const pool = require('./database.js');

const Admin = require('./classes/admin');
const Prof = require('./classes/professional');
const Supplier = require('./classes/supplier');
const Medicine = require('./classes/medicine');

const app = express();

app.use(morgan('dev'));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.json());
app.use(express.static('pages'));
app.use(cors());

app.get('/test', (req, res) => {
  pool.query('SELECT NOW()', (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).send('Erro ao consultar o banco de dados');
    } else {
      res.send(`Resultado da consulta: ${result.rows[0].now}`);
    }
  });
})

app.get('/register', (req, res) => {
    res.sendFile(path.join(__dirname, '../pages/index.html'));
});

app.listen(3000, () => {
  console.log('Servidor iniciado na porta 3000 http://localhost:3000/register');
});
