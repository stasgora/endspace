import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/utils/ui/theme_config.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomCodeField extends StatefulWidget {
  final TextEditingController controller;

  const CustomCodeField(this.controller) : super();

  @override
  _CustomCodeFieldState createState() => _CustomCodeFieldState();
}

class _CustomCodeFieldState extends State<CustomCodeField> {
  String currentText = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: PinCodeTextField(
        appContext: context,
        textStyle: Theme.of(context).textTheme.headline1,
        pastedTextStyle: Theme.of(context).textTheme.headline1,
        length: MiscTheme.codeLength,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),
          fieldHeight: 50,
          fieldWidth: 40,
          activeColor: Colors.white,
          activeFillColor: AppColors.textFieldBasicBackground,
          selectedColor: Colors.white,
          selectedFillColor: Colors.amber,
          inactiveColor: AppColors.textFieldBasicBackground,
          inactiveFillColor: Colors.white,
        ),

        cursorColor: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        enableActiveFill: true,
        controller: widget.controller,
        keyboardType: TextInputType.text,
        boxShadows: [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
        onCompleted: (v) {

        },
        onChanged: (value) {
          setState(() {
            currentText = value;
          });
        },
        beforeTextPaste: (text) {
          return true;
        },
      )
    );
  }
}
