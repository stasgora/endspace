import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../model/room.dart';
import 'cubit_base.dart';

class StartPageCubit extends CubitBase<StartPageState> {
  StartPageCubit(ModalRoute route)
      : super(route: route, initialState: StartPageState()) {
    addCallbacks({
      'roomJoined': _onRoomJoined,
      'unknownCode': _onUnknownCode,
    });
  }

  void _onRoomJoined(dynamic room) {
    navigator?.pushNamed('/room-page', arguments: Room.fromJson(room));
  }

  void _onUnknownCode(dynamic args) => print('No such room');

  void createRoom(String name) => connection.send(
        'createRoom',
        {'name': name},
      );

  void joinRoom({required String name, required String roomCode}) {
    connection.send('joinRoom', {'name': name, 'roomCode': roomCode});
  }
}

class StartPageState extends Equatable {
  @override
  List<Object> get props => [];
}
