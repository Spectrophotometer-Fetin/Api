const Users = require("../models/users");
const UsersHistoric = require("../models/usersHistoric");
const generateDataController = require("./generateDataController");
const sendUserController = require("./sendUserController");

module.exports = {

  getUserHistoric: async function (req, res) {
    const userHistoric = await UsersHistoric.findAll({
      raw: true,
      where: {
        userId: req.body.userId
      }
    });

    userHistoric.forEach((userData) => {
      const date = new Date(userData.createdAt);
      const year = date.getFullYear();
      const month = date.getMonth() + 1;
      const day = date.getDate();
      userData.year = year;
      userData.month = month;
      userData.day = day;
    })

    const currentDate = new Date();
    const currentMonth = currentDate.getMonth() + 1;
    const groupedData = {};

    userHistoric.forEach(entry => {
      if (entry.month !== currentMonth)
        return;
      const day = entry.day;
      if (!groupedData[day]) {
        groupedData[day] = {
          day,
          valueSum: 0,
          count: 0
        };
      }
      groupedData[day].valueSum += entry.value;
      groupedData[day].count++;
    });

    const result = Object.values(groupedData).map(entry => {
      const averageValue = Math.round(entry.valueSum / entry.count);
      return {
        day: entry.day,
        value: averageValue
      };
    });

    console.log(result);
    res.status(200).json({
      data: result
    })
  },

  saveUserData: async function (req, res) {
    const userId = req.body.userId;
    const deviceId = req.body.deviceId;
    const userData = {
      userId,
      value: await generateDataController.getData(userId, deviceId),
    }
    console.log(userData);
    try {
      await UsersHistoric.create(userData)
      await sendUserController.sendUserData(req, res, userData.value, deviceId);
    } catch (error) {
      return res.status(404).json({
        error: true,
        message: error
      })
    }
  },

  lastRecord: async function (req, res) {
    const userId = req.body.userId || req.query.userId;
    const lastRecord = await UsersHistoric.findOne({
      raw: true,
      where: {
        userId: userId,
      },
      order: [['id', 'DESC']],
    });
    res.status(200).json({
      data: lastRecord
    })
  },

  saveUserInfo: async function (req, res) {
    const userData = req.body.userData || {};
    const userId = req.body.userId || req.query.userId;
    console.log(userData, userId);
    try {
      await Users.update(userData, {
        where: {
          id: userId
        }
      });
      return res.status(200).json({
        error: false,
        message: 'Success'
      });
    } catch (error) {
      console.log(error);
      return res.status(500).json({
        error: true,
        message: error
      });
    }
  },

  getUserInfo: async function (req, res) {
    const userId = req.body.userId || req.query.userId;
    try {
      const response = await Users.findOne({
        where: {
          id: userId
        },
        attributes: ['height', 'weight']
      })
      return res.status(200).json(response);
    } catch (error) {
      return res.status(500).json({
        error: true,
        message: error
      });
    }
  },



};
