import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/room_cubit.dart';

class Screen extends StatelessWidget {
  Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //context.watch<RoomCubit>().createRoom('ME');
    return BlocListener<RoomCubit, RoomState>(
      listener: (context, state) {
        if (state is RoomJoined) {
          //print('navigate');
        }
      },
      child: Container(),
    );
  }
}
