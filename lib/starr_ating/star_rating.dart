import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StarRating extends StatelessWidget {
  final num rating;
  final double iconSize;
  final IconData icon;
  final IconData icon2;

  const StarRating({
    required this.rating,
    this.iconSize = 18.0,
    this.icon = Icons.star,
    this.icon2 = Icons.star_border,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 0; i < 5; i++)
            Icon(
              rating > i ? icon : icon2,
              size: iconSize,
              color: rating > i ? HexColor('#ebcc1b') : HexColor('#000000'),
            ),
        ],
      );
}
