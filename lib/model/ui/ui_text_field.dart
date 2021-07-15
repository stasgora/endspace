import 'package:flutter/cupertino.dart';

class UITextField {
  final TextEditingController controller;
  final String? hint;
  final String? label;
  final int maxLength;

  UITextField(this.controller, {this.hint, this.label, this.maxLength = 8});
}