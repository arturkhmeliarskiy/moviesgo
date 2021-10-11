import 'dart:async';
import 'package:flutter_app/colors/movie_color.dart';
import 'package:flutter_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeApp extends StatefulWidget {
  @override
  _ThemeAppState createState() => _ThemeAppState();
}

class _ThemeAppState extends State<ThemeApp> {
  // bool select = false;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        ListTile(
          title: LocaleText(themeProvider.isDarkMode ? "Dark" : "Light",
              style: TextStyle(
                  color: HexColor('#585858'),
                  fontSize: 16,
                  fontWeight: FontWeight.normal)),
          trailing: CupertinoSwitch(
            activeColor: Theme.of(context).cardColor,
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              final provider =
                  Provider.of<ThemeProvider>(context, listen: false);
              provider.toggleTheme(value);
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
