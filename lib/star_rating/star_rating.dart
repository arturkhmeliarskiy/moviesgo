import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StarRating extends StatelessWidget {
  final num rating;
  final double iconSize;
  final IconData icon;
  final IconData icon2;
  final double fontSizes;
  final double marginLeft;

  const StarRating({
    required this.rating,
    this.iconSize = 18.0,
    this.icon = Icons.star,
    this.icon2 = Icons.star_border,
    this.fontSizes = 12,
    this.marginLeft = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          for (int i = 0; i < 5; i++)
            Icon(
              rating > i ? icon : icon2,
              size: iconSize,
              color: rating > i ? HexColor('#ebcc1b') : HexColor('#000000'),
            ),
          Container(
            margin: EdgeInsets.only(left: marginLeft),
            child: Text(
              '${rating.toStringAsFixed(1)}',
              style: TextStyle(fontSize: fontSizes),
            ),
          )
        ],
      );
}
