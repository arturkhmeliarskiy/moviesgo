import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hexcolor/hexcolor.dart';

class Localization extends StatefulWidget {
  @override
  _LocalizationState createState() => _LocalizationState();
}

String select = '';

class _LocalizationState extends State<Localization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#fff'),
        title: Center(
          child: LocaleText(
            "Language",
            style: TextStyle(color: HexColor('#4b1d97')),
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('English',
                style: TextStyle(
                    color: '${LocaleNotifier.of(context)!.locale}' == 'en'
                        ? HexColor('#4b1d97')
                        : HexColor('#585858'),
                    fontSize: 16,
                    fontWeight: '${LocaleNotifier.of(context)!.locale}' == 'en'
                        ? FontWeight.bold
                        : FontWeight.normal)),
            onTap: () {
              LocaleNotifier.of(context)!.change('en');
              setState(() {
                select = 'en';
              });
            },
            trailing: '${LocaleNotifier.of(context)!.locale}' == 'en'
                ? Icon(
                    Icons.check_box,
                    color: '${LocaleNotifier.of(context)!.locale}' == 'en'
                        ? HexColor('#4b1d97')
                        : HexColor('#585858'),
                  )
                : Icon(Icons.check_box_outline_blank),
          ),
          ListTile(
            title: Text(
              'Русский',
              style: TextStyle(
                  color: '${LocaleNotifier.of(context)!.locale}' == 'ru'
                      ? HexColor('#4b1d97')
                      : HexColor('#585858'),
                  fontSize: 16,
                  fontWeight: '${LocaleNotifier.of(context)!.locale}' == 'ru'
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
            onTap: () {
              LocaleNotifier.of(context)!.change('ru');
              setState(() {
                select = 'ru';
              });
              print(LocaleNotifier.of(context)!.locale);
            },
            trailing: '${LocaleNotifier.of(context)!.locale}' == 'ru'
                ? Icon(
                    Icons.check_box,
                    color: '${LocaleNotifier.of(context)!.locale}' == 'ru'
                        ? HexColor('#4b1d97')
                        : HexColor('#585858'),
                  )
                : Icon(Icons.check_box_outline_blank),
          ),
        ],
      ),
    );
  }
}
