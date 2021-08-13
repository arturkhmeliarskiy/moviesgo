import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class GenneMovie extends StatelessWidget {
  final String name;

  const GenneMovie({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(left: 0, top: 10),
        child: Text(
          name,
          style: TextStyle(
            color: HexColor('#585858'),
            fontSize: 15,
          ),
        ),
      );
}
