import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

import '../services/room/room_service.dart';

part 'room_state.dart';

class RoomCubit extends Cubit<RoomState> {
  final _roomService = GetIt.I<RoomService>();

  RoomCubit() : super(RoomInitial()) {
    _roomService.onRoomJoined((code) => emit(RoomJoined(code)));
  }

  void createRoom(String name) => _roomService.createRoom(name: name);

  void joinRoom({required String name, required String roomCode}) {
    _roomService.joinRoom(name: name, roomCode: roomCode);
  }
}
