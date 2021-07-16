import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const mainBackgroundColor = Color.fromARGB(255, 30, 16, 67);
  static const mainColor = Colors.amber;

  //buttons
  static const Color actionButton = Colors.amber;
  
  //textFields
  static const Color textFieldEnabledOutline = Colors.white;
  static const Color textFieldFocusedOutline = Color.fromARGB(170, 255, 255, 255);
  static const Color textFieldBasicBackground = Color.fromARGB(255, 41, 201, 130);


  //text
  static const Color darkTextColor = Colors.black38;
  static const Color mediumTextColor = Colors.white10;
  static const Color lightTextColor = Colors.white;
  static const Color actionButtonText = Colors.white60;
  static const List<Color> avatarColors = [
    Color.fromARGB(255, 255, 190, 11),
    Color.fromARGB(255, 251, 86, 7),
    Color.fromARGB(255, 255, 0, 110),
    Color.fromARGB(255, 131, 56, 236),
    Color.fromARGB(255, 58, 134, 255),
    Color.fromARGB(255, 46, 196, 182)
  ];
}

class MiscTheme {
  static const double actionButtonRadius = 16;
  static const double textFieldRadius = 8;

  static const int codeLength = 8;
  static const int nameLength = 12;


}