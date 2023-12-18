require("dotenv").config();
const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const utils = require('../utils/Utils');
const users = require('../models/users')
const firebaseController = require("../controllers/firebaseController");
const generateDataController = require("../controllers/generateDataController");
const userDataController = require("../controllers/userDataController");
const newsController = require("../controllers/newsController");

router.post('/register', async (req, res) => {

	if (!req.body.email || !req.body.password) {
		res.json({ "res": "Missing data" })
		return;
	}

	if (req.body.password.length == 0) {
		res.json({ "res": "Empty password" })
		return;
	}

	const email = req.body.email;
	const name = req.body.name;
	const age = req.body.age;
	const gender = req.body.gender;

	const psw = await utils.encrypt(req.body.password)

	const uusers = await users.findAll({
		attributes: ['email', 'password'],
		where: {
			email: req.body.email
		}
	});

	if (Object.keys(uusers).length > 0) {
		res.status(400).json({
			error: false,
			message: 'User already exists'
		})
		return;
	}
	const dt = { name: name, email: email, password: psw, age, gender};

	await users.create(dt)
		.then(() => {

			//success
			res.status(200).json({
				error: false,
				message: 'Success'
			})

			//res.redirect(query);
			return;

		}).catch((err) => {
			res.status(404).json({
        error: true,
        message: 'Error while creating user'
      })
			//error
		});

});

//Função de login 
router.post('/login', async (req, res) => {

	const uusers = await users.findAll({
		attributes: ['id', 'name', 'email', 'password', 'age', 'gender'],
		where: {
			email: req.body.email
		}
	});

	if (Object.keys(uusers).length <= 0) {
		res.status(404).json({
			error: true,
			message: "User doesn't exists"
		})
		//error
		return;
	}

	var pass = await utils.validate(req.body.password, uusers[0].dataValues.password);

	if (!pass) {
		res.status(404).json({
			error: true,
			message: "Wrong password"
		})

		// res.redirect(query);
		return;
	}
	return res.status(200).json({
		error: false,
		message: {
			id: uusers[0].dataValues.id,
			name: uusers[0].dataValues.name,
			email: req.body.email,
			age: uusers[0].dataValues.age,
			gender: uusers[0].dataValues.gender
		}
	})
});

router.post('/postUserData', firebaseController.postUserData);
router.post('/getUserHistoric', userDataController.getUserHistoric);
router.post('/saveUserData', userDataController.saveUserData);
router.post('/getLastRecord', userDataController.lastRecord);
router.get('/getNews', newsController.getNews);
router.post('/saveUserInfo', userDataController.saveUserInfo);
router.post('/getUserInfo', userDataController.getUserInfo);

module.exports = router;