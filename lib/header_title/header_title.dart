import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class HeaderTitle extends StatelessWidget {
  final String title;

  const HeaderTitle({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 45, vertical: 0),
        padding: EdgeInsets.only(bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            LocaleText(title,
                style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor)),
            IconButton(
              icon: Icon(Icons.arrow_right_alt),
              onPressed: () {},
              color: Theme.of(context).primaryColor,
              iconSize: 30,
            ),
          ],
        ),
      );
}
