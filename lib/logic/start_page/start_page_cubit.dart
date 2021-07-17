import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:reloadable_bloc/reloadable_bloc.dart';

import '../../model/room.dart';
import '../../services/connection_provider.dart';
import '../cubit_base.dart';

part 'start_page_state.dart';

class StartPageCubit extends CubitBase<StartPageState> {
  final _connection = GetIt.I<ConnectionProvider>();

  StartPageCubit(ModalRoute route)
      : super(
          route: route,
          initialState: RoomInitial(),
        );

  @override
  Future reload(ReloadableReason reason) async => emit(RoomInitial());

  @override
  void show(ReloadableReason reason) {
    super.show(reason);
    _connection.subscribe('roomJoined', _onRoomJoined);
    _connection.subscribe('unknownCode', _onUnknownCode);
  }

  @override
  void hide(ReloadableReason reason) {
    _connection.unsubscribe('roomJoined', _onRoomJoined);
    _connection.unsubscribe('unknownCode', _onUnknownCode);
  }

  void _onRoomJoined(dynamic room) => emit(RoomJoined(Room.fromJson(room)));

  void _onUnknownCode(dynamic args) => print('No such room');

  void createRoom(String name) => _connection.send(
        'createRoom',
        {'name': name},
      );

  void joinRoom({required String name, required String roomCode}) {
    _connection.send('joinRoom', {'name': name, 'roomCode': roomCode});
  }
}
