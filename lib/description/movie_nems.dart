import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class MovieNems extends StatelessWidget {
  final String name;

  const MovieNems({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        name,
        style: TextStyle(
          color: HexColor('#4b1d97'),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      );
}
