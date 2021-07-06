const Order = require('./../firebase/order');
const Admin = require('./../firebase/admin');
const TelegramBot = require('./../telegram/telegramBot');

class OrderService {
    async orderRegister(data) {
        await Order.createOrder(data).then(async () =>  {
            let admins =  await Admin.getAdmins();
            admins.forEach((data) => {
                let admin = data.data();
                TelegramBot.sendOrderNotification(admin.telegramId, admin);
            })
        });
    }
}

module.exports = new OrderService();