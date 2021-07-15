import 'package:socket_io_client/socket_io_client.dart';

class ConnectionProvider {
  late Socket socket;

  ConnectionProvider() : socket = io(
    'https://endspace.herokuapp.com',
    OptionBuilder().setTransports(['websocket']).build(),
  );
}