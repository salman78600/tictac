import 'package:flutter/material.dart';
import 'package:tictac/views/create_room_screen.dart';
import 'package:tictac/views/join_room_screen.dart';
import 'package:tictac/views/main_screen.dart';
import 'package:tictac/views/room_screen.dart';

class AppRoutes {
  static const String main = '/main';
  static const String joinRoom = '/join-room';
  static const String createRoom = '/create-room';
  static const String gameRoom = '/game-room';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case joinRoom:
        return MaterialPageRoute(builder: (_) => JoinRoomScreen());
      case createRoom:
        return MaterialPageRoute(builder: (_) => CreateRoomScreen());
      case gameRoom:
        return MaterialPageRoute(builder: (_) => GameRoom());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
