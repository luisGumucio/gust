const FirebaseCore = require('./firebaseCore');
const moment = require('moment');

class OrderDay {
    constructor() {
        this.db = FirebaseCore.getDb();
    }

    async createOrderDay(data) {
        let stringdate = moment().format("DD/MM/YYYY");
        console.log(stringdate);
        data.date = stringdate;
        return await this.db.collection('orderDay').doc().set(data);
    }
}

module.exports = new OrderDay();