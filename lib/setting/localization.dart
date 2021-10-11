import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hexcolor/hexcolor.dart';

class Localization extends StatefulWidget {
  @override
  _LocalizationState createState() => _LocalizationState();
}


class _LocalizationState extends State<Localization> {
  String select = '';

 final _items =  ['en','ru'];
  @override
  Widget build(BuildContext context) {
    String dropdownvalue = '${LocaleNotifier.of(context)!.locale}';
    return  Column(
        children: [
          ListTile(
            title: LocaleText("Language",
                style: TextStyle(
                     color: HexColor('#585858'),
                    fontSize: 16,
                  fontWeight:  FontWeight.normal
                        )
                        ),
            trailing:   DropdownButton(
                value: dropdownvalue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: _items.map((String item) {
                       return DropdownMenuItem(
                          value: item,
                          child: Text(item)
                        );
              }
                ).toList(),
                onChanged: (String? newValue){
                  LocaleNotifier.of(context)!.change(newValue!);
                  setState(() {
                    dropdownvalue = newValue;
                  });
                  print(Locales.supportedLocales);
                },
              ),
          ),
        ],
      );
  }
}
