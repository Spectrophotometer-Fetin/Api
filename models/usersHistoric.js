const { Sequelize } = require('sequelize');
const db = require('./db');

const UsersHistoric = db.define('users_historic', {
    id:{
        type: Sequelize.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true
    },
    userId:{
        type: Sequelize.INTEGER,
        allowNull: false
    },
    value:{
        type: Sequelize.FLOAT,
        allowNull: false
    }
});

//Criar tabela 
UsersHistoric.sync();
module.exports = UsersHistoric; 