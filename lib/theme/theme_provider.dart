import 'package:flutter/material.dart';
import 'package:flutter_app/colors/movie_color.dart';

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
      scaffoldBackgroundColor: MovieColor.blackBacground,
      primaryColor: MovieColor.yellow,
      highlightColor: MovieColor.white,
      backgroundColor: MovieColor.black,
      textTheme: TextTheme(),
      selectedRowColor: MovieColor.white,
      splashColor: MovieColor.white,
      canvasColor: MovieColor.yellow,
      dividerColor: MovieColor.yellow,
      colorScheme: ColorScheme.dark(),
      shadowColor: MovieColor.blackBacground,
      cardColor: MovieColor.yellow,
      unselectedWidgetColor: Colors.grey,
      iconTheme: IconThemeData(color: MovieColor.yellow));

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: MovieColor.purple,
      backgroundColor: Colors.white,
       highlightColor: MovieColor.black,
      colorScheme: ColorScheme.light(),
      splashColor: MovieColor.purple,
      canvasColor: MovieColor.black,
      dividerColor: MovieColor.red,
      selectedRowColor: MovieColor.black,
      shadowColor: MovieColor.greyShadow,
      cardColor: MovieColor.purple,
      unselectedWidgetColor: Colors.grey,
      iconTheme: IconThemeData(
        color: MovieColor.purple,
      ));
}
