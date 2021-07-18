import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../../model/room.dart';
import '../cubit_base.dart';

part 'room_state.dart';

class RoomCubit extends CubitBase<RoomState> {
  final _navigator = GetIt.I<GlobalKey<NavigatorState>>();

  RoomCubit({required ModalRoute route, required Room room})
      : super(route: route, initialState: RoomState(room)) {
    addCallbacks({
      'playersChange': _onPlayersChange,
      'gameStarted': _onGameStarted,
    });
  }

  void _onGameStarted(dynamic args) {
    _navigator.currentState?.pushNamedAndRemoveUntil(
      '/game-page',
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
