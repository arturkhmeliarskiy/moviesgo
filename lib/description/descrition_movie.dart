import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class DescritionMovie extends StatelessWidget {
  final String descrition;

  const DescritionMovie({
    required this.descrition,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      margin: EdgeInsets.only(top: 10),
      width: 320,
      child: Center(
        child: Text(descrition,
            style: TextStyle(
              color: HexColor('#585858'),
              fontSize: 15,
            ),
            maxLines: 6,
            overflow: TextOverflow.ellipsis),
      ));
}
