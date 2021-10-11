
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeProvider extends ChangeNotifier {
 ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn){
    
  }
}

class MyTheme {
  static final darkTheme =  ThemeData(
    scaffoldBackgroundColor: HexColor('#0000'),
    colorScheme: ColorScheme.dark()
  );

  static final lightTheme =  ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light()
  );
}