const FirebaseCore = require('./firebaseCore');
const moment = require('moment');

class Order {
    constructor() {
        this.db = FirebaseCore.getDb();
    }

    async createOrder(data) {
        data.orderStatus = 'open'
        data.orderCode = _makeid(5);
        return await this.db.collection('order').doc().set(data);
    }
}

function _makeid(length) {
    var result           = '';
    var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for ( var i = 0; i < length; i++ ) {
      result += characters.charAt(Math.floor(Math.random() * 
 charactersLength));
   }
   return result;
}

module.exports = new Order();