import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class IconInfo extends StatelessWidget {
  final String name;
  final String name2;

  const IconInfo({
    required this.name,
    required this.name2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            name,
            style: TextStyle(color: HexColor('#585858'), fontSize: 15),
          ),
          Text(
            name2,
            style: TextStyle(
                color: HexColor('#242757'),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )
        ],
      );
}
