import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenresMovie extends StatelessWidget {
  final List<dynamic> nameGenre;

  const GenresMovie({
    required this.nameGenre,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      margin: EdgeInsets.only(left: 0, top: 10),
      child: Text(nameGenre.map((e) => e['name']).join(', ')));
}
