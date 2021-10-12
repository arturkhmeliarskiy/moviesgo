import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flag/flag.dart';
class Localization extends StatefulWidget {
  @override
  _LocalizationState createState() => _LocalizationState();
}

class _LocalizationState extends State<Localization> {
  String select = '';

  final _items = ['us', 'ru'];
  @override
  Widget build(BuildContext context) {
    final String dropdownvalue =
        "${LocaleNotifier.of(context)!.locale}" == 'us' ? 'us' : 'ru';
    return Column(
      children: [
        ListTile(
          title: LocaleText("Language",
              style: TextStyle(
                  color: Theme.of(context).selectedRowColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal)),
          trailing: DropdownButton(
            style: TextStyle(color: Theme.of(context).primaryColor), dropdownColor: Theme.of(context).scaffoldBackgroundColor,
            value: dropdownvalue,
            underline: SizedBox(),
            // icon: SizedBox.shrink(),
            items: _items.map((String item) {
              return DropdownMenuItem(
                value: item, child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  // Container(child: Text(item, style: TextStyle(fontSize: 15),), ),
                  Flag.fromString(
                  '$item',
                  height: 18,
                  width: 25,
                  fit: BoxFit.fill,
                ),
                  ],
                ),
              ), );
            }).toList(),
            onChanged: (String? newValue) {
              LocaleNotifier.of(context)!.change(newValue!);
              setState(() {
                // dropdownvalue = newValue;
              });
              print(Locales.supportedLocales);
            },
          ),
        ),
      ],
    );
  }
}
