import 'package:get_it/get_it.dart';

import '../../model/room.dart';
import '../connection_provider.dart';
import 'room_service.dart';

class SocketRoomService implements RoomService {
  final connection = GetIt.I<ConnectionProvider>();

  @override
  void joinRoom({required String name, required String roomCode}) {
    connection.socket.emit('joinRoom', {
      'name': name,
      'roomCode': roomCode,
    });
  }

  @override
  void createRoom({required String name}) {
    connection.socket.emit('createRoom', {
      'name': name,
    });
  }

  @override
  void leaveRoom() => connection.socket.emit('leaveRoom');

  @override
  void onRoomJoined(void Function(Room) callback) {
    connection.socket.on('roomJoined', (data) => callback(Room.fromJson(data)));
  }

  @override
  void onPlayersChanged(void Function(List<String>) callback) {
    connection.socket.on('playersChange', (data) => callback((data as List).cast<String>()));
  }
}
