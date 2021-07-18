import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/ui/ui_button.dart';
import '../../utils/ui/theme_config.dart';

class ActionButton extends StatelessWidget {
  final UIButton button;

  const ActionButton(this.button) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Colors.white,
            width: 4.0
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          backgroundColor: AppColors.actionButton,
          padding: EdgeInsets.fromLTRB(32, 16, 32, 8)
        ),
        child: Text(button.text, style: Theme.of(context).textTheme.button),
        onPressed: onButtonPressed
      )
    );
  }

  Future<void> onButtonPressed() async {
    if(button.type == UIButtonType.forward) FlameAudio.play("click.mp3");
    else if(button.type == UIButtonType.back) FlameAudio.play("back.mp3");
    else if(button.type == UIButtonType.gameStart) FlameAudio.play("start.mp3");
    button.action();
  }
}
