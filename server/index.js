const express = require("express");
const mongoose = require('mongoose');
const http = require("http");

const app = express();
const PORT = process.env.PORT || 3000;

var server = http.createServer(app);
var io = require("socket.io")(server);

const Room = require("./models/room");

// Middleware
app.use(express.json());

const DB = "mongodb+srv://imsalman5873:tUpWkN5ugwl4U5HD@cluster0.o8fw3d4.mongodb.net/"

io.on("connection", (socket) => {
    console.log("New client connected");
    socket.on("createRoom", async ({ nickname }) => {
        console.log(`Room created: ${nickname}`);
        try {

            let room = new Room();
            let player = {
                nickname: nickname,
                socketID: socket.id,
                playerType: "X",
            };
            room.players.push(player);
            room.turn = player;
            room.turnIndex = 0;
            room = await room.save();
            const roomId = room._id.toString();
            socket.join(roomId);
            // io will send the roomId to everyone
            io.to(roomId).emit("createRoomSuccess", room);

        } catch (err) {
            console.error(err);
        }


    });

    socket.on("joinRoom", async ({ roomId, nickname }) => {
        console.log(`Room joined: ${roomId}`);
        try {
            if(!roomId.match(/^[0-9a-fA-F]{24}$/)) {
                console.log("Invalid Game ID format");
                socket.emit("errorOccured", "Invalid Game ID");
                return;
            }

            let room = await Room.findById(roomId);
            if (room.isJoin) {
                let player = {
                    nickname,
                    socketID: socket.id,
                    playerType: "O",
                }
                socket.join(roomId);
                room.players.push(player);
                room.isJoin = false;
                room = await room.save();
                io.to(roomId).emit("joinRoomSuccess", room);
                io.to(roomId).emit("updatePlayers", room.players);
                io.to(roomId).emit("updateRoom", room);
            }else{
                socket.emit("errorOccured", "Game has already started");
                return;
            }

        } catch (err) {
            console.error(err);
        }

    }
    );


socket.on("tap", async ({ index, roomId }) => {
    try {
      let room = await Room.findById(roomId);

      let choice = room.turn.playerType; // x or o
      if (room.turnIndex == 0) {
        room.turn = room.players[1];
        room.turnIndex = 1;
      } else {
        room.turn = room.players[0];
        room.turnIndex = 0;
      }
      room = await room.save();
      io.to(roomId).emit("tapped", {
        index,
        choice,
        room,
      });
    } catch (e) {
      console.log(e);
    }
  });

  socket.on("winner", async ({ winnerSocketId, roomId }) => {
    try {
      let room = await Room.findById(roomId);
      let player = room.players.find(
        (playerr) => playerr.socketID == winnerSocketId
      );
      player.points += 1;
      room = await room.save();

      if (player.points >= room.maxRounds) {
        io.to(roomId).emit("endGame", player);
      } else {
        io.to(roomId).emit("pointIncrease", player);
      }
    } catch (e) {
      console.log(e);
    }
  });
});


mongoose.connect(DB)
    .then(() => console.log('✅ Connected to MongoDB'))
    .catch((err) => console.error('❌ MongoDB connection error:', err));

server.listen(PORT, "0.0.0.0", () => {
    console.log(`Server is running on port ${PORT}`);
}
);