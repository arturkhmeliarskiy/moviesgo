import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moviego_services/data_models/my_list.dart';
import 'dart:convert';

class MyList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyList();
}

class _MyList extends State<MyList> {
//  static late SharedPreferences _preferences;

//   static const _keyUser = 'user';
//   static const myUser = User()

//   static Future setUser(User user) async {
//     final json = jsonEncode(user.toJson());
//     await _preferences.setString(_keyUser, json);
//   }

//   static User getUser() {
//     final json = _preferences.getString(_keyUser);
//     return json == null ? myUser : User.fromJson(jsonDecode(json));
//   }

  _getResult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var lists_my = jsonDecode(prefs.getString('key')!);
    print(lists_my);
  }

  // main() {
  //   String complexText =
  //       '{"id": 1, "title": "Way to parse Json", "posterpath": "https://miro.medium.com/max/1400/1*Ufd34tmI3Ortayiq9ZsNDA.png", "voteAverage" : 8.9}';
  //   var lists_my = jsonDecode(complexText);
  //   print(lists_my);
  // }

  Widget build(BuildContext context) {
    print(_getResult);
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 300),
          child: Column(
            children: [
              // Text(State(list_my)),
              RaisedButton(
                onPressed: _getResult,
                child: Text('Increment Counter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
