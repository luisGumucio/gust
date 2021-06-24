const firebase = require('firebase-admin');
const serviceAccount = process.env.GOOGLE_SERVICE;

class FirebaseCore {
    constructor() {
        firebase.initializeApp({
            credential: firebase.credential.cert(serviceAccount)
        })
    }

    getAuth() {
        return firebase.auth();
    }

    getDb() {
        return firebase.firestore();
    }
}

module.exports = new FirebaseCore();