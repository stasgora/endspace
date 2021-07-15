import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/model/ui/ui_button/ui_button.dart';
import 'package:game/widgets/buttons/action_button.dart';

class StartPage extends StatelessWidget {
  const StartPage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ActionButton(UIButton("START", onStartButton)),
          Row(
              children: <Widget>[
                Expanded(
                    child: Divider()
                ),
                Text("OR", style: Theme.of(context).textTheme.caption),
                Expanded(
                    child: Divider()
                ),
              ]
          ),
          ActionButton(UIButton("JOIN", onJoinButton))
        ],
      )
    );
  }

  void onStartButton() {

  }

  void onJoinButton() {

  }
}
