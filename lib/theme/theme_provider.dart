

import 'package:flutter/material.dart';
import 'package:flutter_app/colors/movie_color.dart';
import 'package:hexcolor/hexcolor.dart';

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

