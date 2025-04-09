import 'package:flutter/material.dart';

class GameRoom extends StatefulWidget {
  const GameRoom({super.key});

  @override
  State<GameRoom> createState() => _GameRoomState();
}

class _GameRoomState extends State<GameRoom> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Game Room',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
