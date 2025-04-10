import 'package:flutter/material.dart';
import 'package:tictac/models/player.dart';

class RoomProvider extends ChangeNotifier {
  Map<String, dynamic> _roomData = {};
  Player _player1 =
      Player(nickname: '', socketId: '', points: 0, playerType: 'X');
  Player _player2 =
      Player(nickname: '', socketId: '', points: 0, playerType: 'O');
  Map<String, dynamic> get roomData => _roomData;

  Player? get player1 => _player1;
  Player? get player2 => _player2;

  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> data) {
    _player1 = Player.fromMap(data);
    notifyListeners();
  }

  void updatePlayer2(Map<String, dynamic> data) {
    _player2 = Player.fromMap(data);
    notifyListeners();
  }
}
