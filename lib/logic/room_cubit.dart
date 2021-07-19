import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../model/room.dart';
import 'base/cubit_base.dart';

class RoomCubit extends CubitBase<RoomState> {
  RoomCubit({required ModalRoute route, required Room room})
      : super(route: route, initialState: RoomState(room)) {
    addCallbacks({
      'playersChange': _onPlayersChange,
      'gameStarted': _onGameStarted,
    });
  }

  void _onGameStarted(dynamic args) {
    navigator?.pushNamedAndRemoveUntil(
      '/game-dashboard',
      (route) => false,
    );
  }

  void _onPlayersChange(dynamic players) => emit(RoomState(Room(
        code: state.room.code,
        players: (players as List).cast<String>(),
      )));

  void exitRoom() => connection.send('leaveRoom');

  void startGame() => connection.send('startGame');
}

class RoomState extends Equatable {
  final Room room;

  RoomState(this.room);

  @override
  List<Object> get props => [room];
}