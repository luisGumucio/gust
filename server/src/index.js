const {Telegraf} = require('telegraf')
const {MenuTemplate, MenuMiddleware} = require('telegraf-inline-menu')
const Authentication = require('./firebase/authentication');
const Client = require('./firebase/client');

const menuTemplate = new MenuTemplate(() => 'Bienvenido vamos realizar unos simples pasos para registralo\n' + 'por favor hacer click en los botones');
const bot = new Telegraf(process.env.TELEGRAM_TOKEN);

const requestLocationKeyboard = {
    "reply_markup": {
        "one_time_keyboard": true,
        "keyboard": [
            [{
                text: "Mi ubicacion",
                request_location: true,
                callback_data: "location"  
            }],
            ["Cancel"]
        ]
    }

}
const requestPhoneKeyboard = {
    "reply_markup": {
        "one_time_keyboard": true,
        "keyboard": [
            [{
                text: "Mi contacto",
                request_contact: true,
                one_time_keyboard: true,
                callback_data: 'location',
                force_reply: true, 
            }],
            ["Cancel"]
        ]
    }
};

menuTemplate.interact('Registrarme \uD83D\uDEB9', 'b', {
	do: async ctx => {
        bot.telegram.sendMessage(ctx.chat.id, 'Enviar mi contacto', requestPhoneKeyboard).then(() => {
            bot.on('contact', (msg) => {
                const contact = msg.message.contact;
                bot.telegram.sendMessage(ctx.chat.id, 'Enviar mi ubicacion', requestLocationKeyboard).then(() => {
                    bot.on('location', (msg) => {
                        const location = msg.message.location;
                        const email = `${contact.first_name}@gust.org`;
                        Authentication.createUser(email, contact.phone_number)
                        .then((result) => {
                            const client = {
                                "firstName": contact.first_name,
                                "phoneNumber": contact.phone_number,
                                "location": location,
                                "userId": result.uid
                            }
                            Client.createClient(client).then(() => {
                                bot.telegram.sendMessage(ctx.chat.id, 'Su registro finalizo con exito\n' 
                                + `Su usuario es: ${email}\n`
                                + `Su password es: ${contact.phone_number}\n`
                                + '\n'
                                + 'Por favor hacer click en el link\n'
                                + 'https://gustchicken.page.link/helloworld');
                            })
                            
                        });                        
                    });
                });
            })
        });
		return true;
	}
})

const menuMiddleware = new MenuMiddleware('/', menuTemplate)
bot.command('start', ctx => menuMiddleware.replyToContext(ctx))
bot.use(menuMiddleware)
bot.action('location', (ctx) => ctx.reply('Hey there'));

bot.launch()