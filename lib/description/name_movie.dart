import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NameMovie extends StatelessWidget {
  final String name;

  const NameMovie({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        name,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      );
}
