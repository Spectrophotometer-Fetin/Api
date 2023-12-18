const News = require("../models/news");
module.exports = {

  getNews: async function (req, res) {
    try {
      const news = await News.findAll({
        raw: true,
      });
      res.status(200).json({'news': news})
    } catch (error) {
      res.status(404).json({
        'error': error
      })
    }
  },

};
