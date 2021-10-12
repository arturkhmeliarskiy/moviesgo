import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/colors/movie_color.dart';
import 'package:flutter_app/setting/localization.dart';
import 'package:flutter_app/setting/theme.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hexcolor/hexcolor.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

String select = '';

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#fff'),
        title: Center(
          child: LocaleText(
            "Setting",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
             Localization(),
            ThemeApp()
          ],
        ),
      ),
    );
  }
}
