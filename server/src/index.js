const express = require('express');
const app = express();
const http = require('http');
var bodyParser = require('body-parser')
const server = http.createServer(app);
const TelegramBot = require('./telegram/telegramBot');


app.use(bodyParser.json());
require('./routes')(app);

server.listen(3000, () => {
    TelegramBot.botOnBoarding();
    console.log('listening on *:3000');
});