import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var children2 = [
      Container(
        width: 1000,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(150),
              bottomRight: Radius.circular(150)),
          child: Image.network(
            'https://wallpaperaccess.com/full/240167.jpg',
            fit: BoxFit.cover,
            width: 1000,
            height: 350,
          ),
        ),
      )
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'MOVIEGO',
          style: TextStyle(color: HexColor('#ce412e')),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: HexColor('#ffffff'),
            iconSize: 30,
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: children2,
          ),
        ),
      ),
    );
  }
}
