class Player {
  String? nickname;
  String? socketId;
  double? points;
  String? playerType;

  Player({
    this.nickname,
    this.socketId,
    this.points,
    this.playerType,
  });

  Map<String, dynamic> toMap() {
    return {
      'nickname': nickname,
      'socketId': socketId,
      'points': points,
      'playerType': playerType,
    };
  }

  factory Player.fromMap(Map<String, dynamic> json) {
    return Player(
      nickname: json['nickname'] as String?,
      socketId: json['socketId'] as String?,
      points: json['points']?.toDouble() ?? 0.0,
      playerType: json['playerType'] as String?,
    );
  }
}
