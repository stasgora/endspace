import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:game/utils/ui/theme_config.dart';

class UIButton {
  final String text;
  Color color;
  Color textColor;
  final IconData? icon;
  final void Function()? action;

  UIButton(this.text, this.action, [this.color = AppColors.actionButton, this.textColor = AppColors.actionButtonText, this.icon]);
}