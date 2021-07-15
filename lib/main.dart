import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'logic/room_cubit.dart';
import 'screen.dart';
import 'services/connection_provider.dart';
import 'services/room/room_service.dart';
import 'services/room/socket_room_service.dart';

void main() {
  GetIt.I.registerSingleton(ConnectionProvider());
  GetIt.I.registerSingleton<RoomService>(SocketRoomService());

  runApp(SpaceGame());
}

class SpaceGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'End Space',
      home: withCubit(Screen(), RoomCubit()),
    );
  }

  Widget withCubit<CubitType extends Cubit>(Widget widget, CubitType cubit) {
    return BlocProvider(
      create: (context) => cubit,
      child: widget,
    );
  }
}
