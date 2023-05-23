import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io_client;

class SocketService with ChangeNotifier {
  dynamic assignedTask;
  final socket = socket_io_client.io('http://192.168.1.4:1010', {
    "transports": ['websocket'],
    "autoConnect": false,
  });
  void assignTask(data) {
    assignedTask = data;
    notifyListeners();
  }

  void connect() {
    socket.connect();
    socket.onConnect((_) {
      if (kDebugMode) {
        print("Connect to socket.io server");
      }
    });
    socket.emit("joinChannel", "taskChannel");
    socket.on('receiveTask', (data) {
      assignTask(data);
    });
  }
}
