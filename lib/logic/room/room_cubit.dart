import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

import '../../model/room.dart';
import '../../services/room/room_service.dart';

part 'room_state.dart';

class RoomCubit extends Cubit<RoomState> {
  final _roomService = GetIt.I<RoomService>();

  RoomCubit(Room room) : super(RoomState(room)) {
    _roomService.onPlayersChanged((players) => emit(RoomState(Room(
      code: state.room.code,
      players: players,
    ))));
  }
}
