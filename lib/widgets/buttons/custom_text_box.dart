import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../model/ui/ui_text_field.dart';

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
        controller: uiTextField.controller,
        style: Theme.of(context).textTheme.button!.copyWith(fontSize: 24, letterSpacing: 1),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.white,
              width: 4
            )
          ),
          fillColor: Colors.white,
          hintText: uiTextField.hint,
          labelText: uiTextField.label
        ),
        cursorColor: Colors.white,

      ),
    );
  }
}
