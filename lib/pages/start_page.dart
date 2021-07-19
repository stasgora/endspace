import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/start_page_cubit.dart';
import '../model/ui/ui_button.dart';
import '../model/ui/ui_text_field.dart';
import '../widgets/buttons/action_button.dart';
import '../widgets/buttons/custom_code_field.dart';
import '../widgets/buttons/custom_text_field.dart';

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
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
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
                    CustomTextField(UITextField(nameController, TextFieldType.name)),
                    ActionButton(UIButton("Create room", onStartButton, UIButtonType.forward)),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(children: <Widget>[
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
                              .copyWith(color: Colors.white, fontSize: 20),
                        ),
                        Expanded(child: Divider(color: Colors.grey)),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        "Enter code:",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 24),
                      ),
                    ),
                    CustomCodeField(roomController),
                    ActionButton(UIButton("JOIN", onJoinButton, UIButtonType.forward))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onStartButton() {
    FocusScope.of(context).requestFocus(FocusNode());
    context.read<StartPageCubit>().createRoom(nameController.text);
  }

  void onJoinButton() {
    FocusScope.of(context).requestFocus(FocusNode());
    context.read<StartPageCubit>().joinRoom(
          name: nameController.text,
          roomCode: roomController.text,
        );
  }

  @override
  void dispose() {
    nameController.dispose();
    roomController.dispose();
    super.dispose();
  }
}
