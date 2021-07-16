import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../model/ui/ui_text_field.dart';
import '../../utils/ui/theme_config.dart';

enum InputBorderType {basic, focused, enabled}

class CustomTextField extends StatelessWidget {
  final UITextField uiTextField;

  const CustomTextField(this.uiTextField) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      child: TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(uiTextField.maxLength)
        ],
        maxLength: uiTextField.maxLength,
        controller: uiTextField.controller,
        style: Theme.of(context).textTheme.button!.copyWith(fontSize: 24, letterSpacing: 1),
        decoration: InputDecoration(
          border: _getOutlineInputBorder(InputBorderType.basic),
          fillColor: AppColors.textFieldBasicBackground,
          hintText: uiTextField.hint,
          labelText: uiTextField.label,
          hintStyle: Theme.of(context).textTheme.button,
          labelStyle: Theme.of(context).textTheme.button!.copyWith(fontSize: 24, letterSpacing: 1),
          filled: true,
          enabledBorder: _getOutlineInputBorder(InputBorderType.enabled),
          focusedBorder: _getOutlineInputBorder(InputBorderType.focused),
        ),
        cursorColor: Colors.white,

      ),
    );
  }

  OutlineInputBorder _getOutlineInputBorder(InputBorderType type) {
    Color color;
    switch (type) {
      case InputBorderType.basic:
        color = AppColors.textFieldBasicBackground;
        break;
      case InputBorderType.focused:
        color = AppColors.textFieldFocusedOutline;
        break;
      case InputBorderType.enabled:
        color = AppColors.textFieldEnabledOutline;
        break;
    }

    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(MiscTheme.textFieldRadius),
        borderSide: BorderSide(
            color: color,
            width: 4
        )
    );
  }
}
