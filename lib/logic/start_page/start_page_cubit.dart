import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:reloadable_bloc/reloadable_bloc.dart';

import '../../model/room.dart';
import '../cubit_base.dart';

part 'start_page_state.dart';

class StartPageCubit extends CubitBase<StartPageState> {
  StartPageCubit(ModalRoute route)
      : super(route: route, initialState: RoomInitial()) {
    addCallbacks({
      'roomJoined': _onRoomJoined,
      'unknownCode': _onUnknownCode,
    });
  }

  @override
  Future reload(ReloadableReason reason) async => emit(RoomInitial());

  void _onRoomJoined(dynamic room) => emit(RoomJoined(Room.fromJson(room)));

  void _onUnknownCode(dynamic args) => print('No such room');

  void createRoom(String name) => connection.send(
        'createRoom',
        {'name': name},
      );

  void joinRoom({required String name, required String roomCode}) {
    connection.send('joinRoom', {'name': name, 'roomCode': roomCode});
  }
}
