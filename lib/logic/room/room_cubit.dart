import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:reloadable_bloc/reloadable_bloc.dart';

import '../../model/room.dart';
import '../../services/connection_provider.dart';
import '../cubit_base.dart';

part 'room_state.dart';

class RoomCubit extends CubitBase<RoomState> {
  final _connection = GetIt.I<ConnectionProvider>();
  final _navigator = GetIt.I<GlobalKey<NavigatorState>>();

  RoomCubit({required ModalRoute route, required Room room})
      : super(
          route: route,
          initialState: RoomState(room),
        );

  @override
  void show(ReloadableReason reason) {
    super.show(reason);
    _connection.subscribe('playersChange', _onPlayersChange);
    _connection.subscribe('gameStarted', _onGameStarted);
  }

  @override
  void hide(ReloadableReason reason) {
    _connection.unsubscribe('playersChange', _onPlayersChange);
    _connection.unsubscribe('gameStarted', _onGameStarted);
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

  void exitRoom() => _connection.send('leaveRoom');

  void startGame() => _connection.send('startGame');
}
