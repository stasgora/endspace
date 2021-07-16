import 'package:flutter/cupertino.dart';
import '../../utils/app_strings.dart';
import '../../utils/ui/theme_config.dart';

enum TextFieldType {name, other}

class UITextField {
  final TextEditingController controller;
  final TextFieldType type;
  final String? label;
  final String? hint;
  final int maxLength;

  UITextField(this.controller, this.type)
      : maxLength = type == TextFieldType.other ? MiscTheme.codeLength : MiscTheme.nameLength,
        label = type == TextFieldType.other ? AppStrings.textFieldCodeLabel : AppStrings.textFieldNameLabel,
        hint = type == TextFieldType.other ? AppStrings.textFieldCodeHint : AppStrings.textFieldNameHint;
}