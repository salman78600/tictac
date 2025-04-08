import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  static SocketClient? _instance;
  IO.Socket? socket;

  SocketClient._internal() {
    socket = IO.io('http://192.168.2.91:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
