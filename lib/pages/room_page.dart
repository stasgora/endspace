import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/room/room_cubit.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomCubit, RoomState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(state.room.code),
            for (var player in state.room.players)
              Text(player),
          ],
        );
      },
    );
  }
}
