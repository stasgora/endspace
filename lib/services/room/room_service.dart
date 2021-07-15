
import '../../model/room.dart';

abstract class RoomService {
  void createRoom({required String name});
  void joinRoom({required String name, required String roomCode});
  void leaveRoom({required String name, required String roomCode});
  void onRoomJoined(void Function(Room) callback);
  void onPlayersChanged(void Function(List<String>) callback);
}

