const OrderDay = require('./../firebase/orderDay');
const TelegramBot = require('./../telegram/telegramBot');

class NotificationService {

    async sendNotification(data)  {
        await OrderDay.createOrderDay(data).then(() => {
            let clients = data.clients;
            clients.forEach((client) => {
                TelegramBot.sendNotfication(client.telegramId, data);
            });
        });
    }
}

module.exports = new NotificationService();