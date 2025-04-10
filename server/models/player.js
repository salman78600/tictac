const mongoose = require("mongoose");
const { Schema } = mongoose;

const playerSchema = new Schema({
    nickname: {
        type: String,
        required: true,
        trim: true,
    },
    socketID: {
        type: String,
    },
    points: {
        type: Number,
        default: 0,
    },
    playerType: {
        required: true,
        type: String,
    },


});
module.exports = playerSchema;