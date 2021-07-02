const FirebaseCore = require('./firebaseCore');

class OrderDay {
    constructor() {
        this.db = FirebaseCore.getDb();
    }

    async createOrderDay(data) {
        return await this.db.collection('orderDay').doc().set(data);
    }
}

module.exports = new OrderDay();