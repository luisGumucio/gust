const FirebaseCore = require('./firebaseCore');
const moment = require('moment');

class Order {
    constructor() {
        this.db = FirebaseCore.getDb();
    }

    async createOrder(data) {
        return await this.db.collection('order').doc().set(data);
    }
}

module.exports = new Order();