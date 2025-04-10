import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictac/provider/room_provider.dart';
import 'package:tictac/resources/socket_methods.dart';
import 'package:tictac/views/widgets/lobby.dart';
import 'package:tictac/views/widgets/score_board.dart';
import 'package:tictac/views/widgets/tictac_board.dart';

class GameRoom extends StatefulWidget {
  const GameRoom({super.key});

  @override
  State<GameRoom> createState() => _GameRoomState();
}

class _GameRoomState extends State<GameRoom> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomProvider roomDataProvider = Provider.of<RoomProvider>(context);
    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Scoreboard(),
                  const TicTacToeBoard(),
                  Text(
                      '${roomDataProvider.roomData['turn']['nickname']}\'s turn'),
                ],
              ),
            ),
    );
  }
}
