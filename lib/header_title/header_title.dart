import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
            Text(title,
                style: TextStyle(fontSize: 18, color: HexColor('#242757'))),
            IconButton(
              icon: Icon(Icons.arrow_right_alt),
              onPressed: () {},
              color: HexColor('#242757'),
              iconSize: 30,
            ),
          ],
        ),
      );
}
