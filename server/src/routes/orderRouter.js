const router = require('express').Router();
const OrderController = require('./orderController');

module.exports = (app) => {
    router.route('/orders')
    .post(OrderController.orderRegister);
    app.use('/api', router);
};