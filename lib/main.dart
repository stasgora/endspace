import 'package:flutter/material.dart';
import 'package:game/pages/start_page.dart';
import 'package:game/utils/ui/theme_config.dart';

void main() {
  runApp(SpaceGame());
}

class SpaceGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'End Space',
      theme: _createAppTheme(),
      themeMode: ThemeMode.light,
      home: StartPage(),
    );
  }

  ThemeData _createAppTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.mainColor,
      fontFamily: 'Lato',
      scaffoldBackgroundColor: AppColors.mainBackgroundColor,
      textTheme: TextTheme(
          headline1: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, color: AppColors.darkTextColor), // Scaffold/appbar headline
          headline2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: AppColors.darkTextColor), // Main headline before lists
          headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal, color: AppColors.darkTextColor), //For headers inside list elements
          subtitle2: TextStyle(fontSize: 13.0, fontWeight: FontWeight.normal, color: AppColors.mediumTextColor), // Little subtitle for headline2
          bodyText1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: AppColors.lightTextColor), // Classic body text on light background
          bodyText2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: AppColors.darkTextColor), // Classic body text on color
          button: TextStyle(fontSize: 32.0, color: AppColors.lightTextColor, fontFamily: 'LuckiestGuy') // (Almost always white) button text
      ),
    );
  }

}