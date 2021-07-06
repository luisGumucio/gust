const FirebaseCore = require('./firebaseCore');

class Admin {
    constructor() {
        this.db = FirebaseCore.getDb();
    }

    async getAdmins(data) {
        return await (await this.db.collection('admins').get()).docs;
    }
}

module.exports = new Admin();