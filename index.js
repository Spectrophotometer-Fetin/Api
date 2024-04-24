require("dotenv").config();

//Configurações 
const express = require('express');
const app = express();
const cors = require('cors');
const nodemailer = require('nodemailer');
const bodyParser = require('body-parser');
const helmet = require("helmet");
const path = require('path');
const api = require('./routes/api');

app.use(express.json());
app.use(cors());
app.use(bodyParser.urlencoded({ extended: true })); 
app.use(bodyParser.json());
app.use(helmet());

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Methods", "GET,PUT,PATCH,POST,DELETE");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

//Rotas 
app.use('/api', api)
//app.use('/site', site)

function startServer() 
{
    //Indicando servidor rodando 
    app.listen(process.env.PORT, () => {
        console.log(`Servidor iniciado em http://${process.env.DB_HOST}:${process.env.PORT}/`);
    });
}

startServer()