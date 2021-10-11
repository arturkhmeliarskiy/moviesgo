import 'package:flutter/material.dart';
import 'package:flutter_app/colors/movie_color.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyTheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: HexColor('#161616'),
      primaryColor: MovieColor.yellow,
      backgroundColor: HexColor('#0f0f0f'),
      textTheme: TextTheme(),
      colorScheme: ColorScheme.dark(),
      cardColor: HexColor('ffc400'),
      unselectedWidgetColor: Colors.grey,
      iconTheme: IconThemeData(color: MovieColor.yellow));

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: MovieColor.purple,
      backgroundColor: Colors.white,
      colorScheme: ColorScheme.light(),
      cardColor: MovieColor.purple,
      unselectedWidgetColor: Colors.grey,
      iconTheme: IconThemeData(
        color: MovieColor.purple,
      ));
}
