const firebase = require('firebase-admin');
module.exports = {

  initFirebase: function(){
    const firebaseInit = require('../firebase/firebase');
    firebaseInit.initFirebase();
  },

  postUserData: function (req, res) {
    const firebaseDB = firebase.database();
    const ref = firebaseDB.ref("measures");
    let finalValue;
    const amount = 1;
    ref.on('value', (snapshot) => {
      data = snapshot.val();
      finalValue = Math.abs(data/amount);
      firebaseDB.ref("data").set(finalValue);
      res.status(200).json({
        error: false,
        code: 200,
        finalValue,
        dateTime: Date(),
        device: 1
      });
    }, (errorObject) => {
      console.log('The read failed: ' + errorObject.name);
      throw new Error(errorObject);
    });
  },

};
