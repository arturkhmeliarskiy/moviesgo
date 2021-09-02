import 'package:flutter/material.dart';
import 'package:flutter_app/bottom_navigation/navigation.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Navigation());
  }
}
