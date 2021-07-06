const OrderService = require('./../services/orderServices');

module.exports = {
    orderRegister: async (req, res) => {
        let data = req.body;
        OrderService.orderRegister(data);
        res.end(JSON.stringify("ok"));
    }
};