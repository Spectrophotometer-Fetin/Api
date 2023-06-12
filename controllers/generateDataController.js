module.exports = {

  generateData: function (req, res) {
    try {
      const { userId, deviceId } = req.body;
      const voltage = Math.floor(Math.random() * (600 - 50 + 1)) + 50;
      res.status(200).json({
        userId,
        deviceId,
        voltage,
        dateTime: Date(),
      });
    } catch (error) {
      console.log(error);
      res.status(400).json({
        error: true,
        message: error.message
      })
    }
  },

};
