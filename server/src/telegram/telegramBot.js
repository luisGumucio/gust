const { Telegraf } = require('telegraf');
const { MenuTemplate, MenuMiddleware } = require('telegraf-inline-menu');
const Authentication = require('./../firebase/authentication');
const Client = require('./../firebase/client');
const Freemarker = require('freemarker');
const { requestPhoneKeyboard, requestLocationKeyboard } = require('./constant/telegramRequest');
path = require('path');

class TelegramBot {
    constructor() {
        this.bot = new Telegraf(process.env.TELEGRAM_TOKEN);
        this.freemarker = new Freemarker({ root: path.join(__dirname, '../templates/') });
    }

    botOnBoarding() {
        const menuTemplate = new MenuTemplate(() => 'Bienvenido vamos realizar unos simples pasos para registralo\n' + 'por favor hacer click en los botones');
        this._registerUser(menuTemplate);
        const menuMiddleware = new MenuMiddleware('/', menuTemplate);
        this.bot.command('start', ctx => menuMiddleware.replyToContext(ctx));
        this.bot.use(menuMiddleware);
        this.bot.launch();
    }

    sendNotfication(telegramId, data) {
        var templatePath = path.join(__dirname, '../templates/notification_items.ftl');
        this.freemarker.renderFile(templatePath, data, (err, result) => {
            if (err) {
                throw new Error(err);
            }
            this.bot.telegram.sendMessage(telegramId, result);
        });
    }

    _registerUser(menuTemplate) {
        menuTemplate.interact('Registrarme \uD83D\uDEB9', 'b', {
            do: async ctx => {
                this.bot.telegram.sendMessage(ctx.chat.id, 'Enviar mi contacto', requestPhoneKeyboard).then(() => {
                    this.bot.on('contact', (msg) => {
                        const contact = msg.message.contact;
                        this.bot.telegram.sendMessage(ctx.chat.id, 'Enviar mi ubicacion', requestLocationKeyboard).then(() => {
                            this.bot.on('location', (msg) => {
                                const location = msg.message.location;
                                const email = `${contact.first_name}@gust.org`;
                                Authentication.createUser(email, contact.phone_number)
                                    .then((result) => {
                                        const client = {
                                            "firstName": contact.first_name,
                                            "phoneNumber": contact.phone_number,
                                            "location": location,
                                            "userId": result.uid,
                                            "telegramId": contact.user_id
                                        }
                                        Authentication.auth
                                            .setCustomUserClaims(result.uid, { 'roles': 'client' })
                                            .then(() => {
                                                Client.createClient(client).then(() => {
                                                    var templatePath = path.join(__dirname, '../templates/notification_register.ftl');
                                                    this.freemarker.renderFile(templatePath, {
                                                        email: email,
                                                        phone: contact.phone_number
                                                    }, (err, result) => {
                                                        if (err) {
                                                            throw new Error(err);
                                                        }
                                                        this.bot.telegram.sendMessage(ctx.chat.id, result);
                                                    });
                                                })
                                            });
                                    });
                            });
                        });
                    })
                });
                return true;
            }
        });
    }
}

module.exports = new TelegramBot();