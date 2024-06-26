const sequelize = require('sequelize');
const { Sequelize } = require('sequelize');
const db = require('./db');

const Users = db.define('Users', {
    id:{
        type: Sequelize.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true
    },
    name: {
        type: Sequelize.STRING,
        allowNull: false
    },
    email:{
        type: Sequelize.STRING,
        allowNull: false
    },
    password:{
        type: Sequelize.STRING,
        allowNull: false
    },
    height:{
        type: Sequelize.STRING,
        allowNull: true
    },
    weight:{
        type: Sequelize.STRING,
        allowNull: true
    },
    age:{
        type: Sequelize.STRING,
        allowNull: false
    },
    gender:{
        type: Sequelize.STRING,
        allowNull: false
    },
});

//Criar tabela 
Users.sync();
module.exports = Users; 