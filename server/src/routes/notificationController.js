const NotificationService = require('./../services/notificationServices');

module.exports = {
    sendNotification: async (req, res) => {
        let data = req.body;
        NotificationService.sendNotification(data);
        res.end(JSON.stringify("ok"));
    }
};