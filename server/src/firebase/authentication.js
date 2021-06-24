const FirebaseCore = require('./firebaseCore');

class Authentication {
    constructor() {
        this.auth = FirebaseCore.getAuth();
    }

    async createUser(email, password) {
        return await this.auth.createUser({
            email: email,
            password: password
        });
    }
}

module.exports = new Authentication();