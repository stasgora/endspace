import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

import '../../model/room.dart';
import '../../services/room/room_service.dart';

part 'start_page_state.dart';

class StartPageCubit extends Cubit<StartPageState> {
  final _roomService = GetIt.I<RoomService>();

  StartPageCubit() : super(RoomInitial()) {
    _roomService.onRoomJoined((room) => emit(RoomJoined(room)));
  }

  void createRoom(String name) => _roomService.createRoom(name: name);

  void joinRoom({required String name, required String roomCode}) {
    _roomService.joinRoom(name: name, roomCode: roomCode);
  }
}
