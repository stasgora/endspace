import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart';

class ConnectionProvider {
  late Socket socket;

  ConnectionProvider() : socket = io(
    'https://endspace.herokuapp.com',
    OptionBuilder().setTransports(['websocket']).build(),
  );

  void send(String event, [dynamic data]) => socket.emit(event, data);

  Future<dynamic> request(String event, [dynamic data]) {
    final response = Completer();
    socket.once('${event}Response', response.complete);
    socket.emit(event, data);
    return response.future.timeout(Duration(seconds: 5), onTimeout: () => null);
  }

  void subscribe(String event, void Function(dynamic) callback) {
    socket.on(event, callback);
  }

  void unsubscribe(String event, void Function(dynamic) callback) {
    socket.off(event, callback);
  }
}