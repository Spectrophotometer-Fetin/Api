const sequelize = require('sequelize');
const { Sequelize } = require('sequelize');
const db = require('./db');

const News = db.define('news', {
    id:{
        type: Sequelize.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true
    },
    title:{
        type: Sequelize.STRING,
        allowNull: false
    },
    url:{
        type: Sequelize.STRING,
        allowNull: false
    },
    image:{
        type: Sequelize.STRING,
        allowNull: false
    }
});

//Criar tabela 
News.sync();
module.exports = News; 