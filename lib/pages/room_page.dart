import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/room/room_cubit.dart';
import '../model/ui/ui_button.dart';
import '../widgets/buttons/action_button.dart';
import '../widgets/player_avatar.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomCubit, RoomState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg2.png"),
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                  repeat: ImageRepeat.repeat,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 32,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ROOM CODE",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 16),
                      ),
                      Text(
                        state.room.code,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          "CREW:",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 24),
                        ),
                      ),
                      _buildCrewList(context),
                      ActionButton(UIButton(
                        "start",
                        () {},
                        UIButtonType.forward
                      )),
                      ActionButton(UIButton(
                        "exit",
                        () {
                          context.read<RoomCubit>().exitRoom();
                          Navigator.of(context).pop();
                        },
                        UIButtonType.back
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Expanded _buildCrewList(BuildContext context) {
    var state = context.watch<RoomCubit>().state;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < state.room.players.length; i++)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                color: Colors.white70,
                child: Row(
                  children: [
                    PlayerAvatar(i + 1),
                    Text(state.room.players[i],
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
