const axios = require('axios');
module.exports = {

  sendUserData: async function (req, res, data, deviceId) {
    const space = (data.length <= 4) ? "   " : "  ";
    try {
      const response = await axios.post(`http://${process.env.NODE_IP}/showResponse/${deviceId}`, {
        value: `${data}${space}mcg/dl`,
        headers: {
          'Content-Type': 'application/json'
        }
      })
      console.log(response);
      return res.status(200).json({
        error: false,
        message: response.data
      });
    } catch (error) {
      console.log(error)
      return res.status(500).json({
        error: true,
        message: error
      });
    }


  }

};
