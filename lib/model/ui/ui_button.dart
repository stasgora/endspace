import 'dart:ui';

import 'package:flutter/cupertino.dart';
import '../../utils/ui/theme_config.dart';

enum UIButtonType {forward, back}

class UIButton {
  final String text;
  Color color;
  Color textColor;
  final UIButtonType type;
  final IconData? icon;
  final void Function() action;

  UIButton(this.text, this.action, this.type, [this.color = AppColors.actionButton, this.textColor = AppColors.actionButtonText, this.icon]);
}