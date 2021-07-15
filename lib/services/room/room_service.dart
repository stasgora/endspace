
abstract class RoomService {
  void createRoom({required String name});
  void joinRoom({required String name, required String roomCode});
  void leaveRoom({required String name, required String roomCode});
  void onRoomJoined(void Function(String) callback);
}

