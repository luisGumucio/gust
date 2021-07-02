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

module.exports = { requestLocationKeyboard, requestPhoneKeyboard };