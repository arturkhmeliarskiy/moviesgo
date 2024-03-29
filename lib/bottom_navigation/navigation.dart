import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home/home_page.dart';
import 'package:flutter_app/setting/setting.dart';
import 'package:flutter_app/my_list/my_list.dart';
import 'package:flutter_app/search/search_page.dart';
import 'package:flutter_locales/flutter_locales.dart';

class Navigation extends StatefulWidget {
  @override
  _Navigation createState() => _Navigation();
}

class _Navigation extends State<Navigation> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    MyList(),
    Setting()
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
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: Locales.string(context, "Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: Locales.string(context, "Search"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: Locales.string(context, "MyList"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: Locales.string(context, "Setting"),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).iconTheme.color,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        onTap: _onItemTapped,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}
