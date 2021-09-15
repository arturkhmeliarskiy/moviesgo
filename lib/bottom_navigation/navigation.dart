import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home/home.dart';
import 'package:flutter_app/localization/localization.dart';
import 'package:flutter_app/my_list/my_list.dart';
import 'package:flutter_app/search/search_screen.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hexcolor/hexcolor.dart';

class Navigation extends StatefulWidget {
  @override
  _Navigation createState() => _Navigation();
}

class _Navigation extends State<Navigation> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Search(),
    MyList(),
    Localization()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final home = Text('Hello');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f4f4f4'),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // ignore: deprecated_member_use
              title: new LocaleText("Home",
                  style: new TextStyle(
                      color: const Color(0xFF06244e), fontSize: 14.0))),
          new BottomNavigationBarItem(
              icon: Icon(Icons.search),
              // ignore: deprecated_member_use
              title: new LocaleText("Search",
                  style: new TextStyle(
                      color: const Color(0xFF06244e), fontSize: 14.0))),
          new BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              // ignore: deprecated_member_use
              title: new LocaleText("MyList",
                  style: new TextStyle(
                      color: const Color(0xFF06244e), fontSize: 14.0))),
          new BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              // ignore: deprecated_member_use
              title: new LocaleText("Setting",
                  style: new TextStyle(
                      color: const Color(0xFF06244e), fontSize: 14.0))),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: HexColor('#4b1d97'),
        onTap: _onItemTapped,
      ),
    );
  }
}
