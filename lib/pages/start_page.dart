import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/room_cubit.dart';
import '../model/ui/ui_button.dart';
import '../model/ui/ui_text_field.dart';
import '../widgets/buttons/action_button.dart';
import '../widgets/buttons/custom_text_box.dart';

class StartPage extends StatefulWidget {
  const StartPage() : super();

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final nameController = TextEditingController();
  final roomController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RoomCubit, RoomState>(
      listener: (context, state) {
        if (state is RoomJoined) {
          //print('navigate');
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(UITextField(nameController, maxLength: 12)),
                  ActionButton(UIButton("START", onStartButton)),
                  Row(children: <Widget>[
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "OR",
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ]),
                  CustomTextField(UITextField(roomController)),
                  ActionButton(UIButton("JOIN", onJoinButton))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onStartButton() {
    context.read<RoomCubit>().createRoom(nameController.text);
  }

  void onJoinButton() {}

  @override
  void dispose() {
    nameController.dispose();
    roomController.dispose();
    super.dispose();
  }
}
