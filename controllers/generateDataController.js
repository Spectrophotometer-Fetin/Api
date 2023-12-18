const axios = require('axios');
module.exports = {

  getData: async function (userId, deviceId) {
    try {
      const response = await axios.post(`http://${process.env.NODE_IP}/getData/${deviceId}`, {
        userId,
        headers: {
          'Content-Type': 'application/json'
        }
      })
      console.log(response.data)
      const concentrationValue = -387 * response.data + 152;
      return concentrationValue.toFixed(1);
    } catch (error) {
      return error;
    }
  }

};
