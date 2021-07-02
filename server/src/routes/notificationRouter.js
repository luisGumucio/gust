const router = require('express').Router();
const NotificationController = require('./notificationController');

module.exports = (app) => {
    router.route('/notifications')
    .post(NotificationController.sendNotification);
    app.use('/api', router);
};