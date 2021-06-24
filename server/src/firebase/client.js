const FirebaseCore = require('./firebaseCore');

class Client {
    constructor() {
        this.db = FirebaseCore.getDb();
    }

    async createClient(data) {
        return await this.db.collection('clients').doc().set(data);
    }
}

module.exports = new Client();