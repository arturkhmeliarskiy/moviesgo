import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GenneMovie extends StatelessWidget {
  final List<dynamic> nameGenre;

  const GenneMovie({
    required this.nameGenre,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 20,
        margin: EdgeInsets.only(left: 0, top: 10),
        child: Center(
          child: ListView.builder(
              itemCount: nameGenre.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final names = nameGenre[index].name;
                print(nameGenre);
                return Container(
                  decoration: new BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Text(
                    names == nameGenre.last.name ? '$names' : '$names, ',
                    style: TextStyle(
                      color: HexColor('#585858'),
                      fontSize: 15,
                    ),
                  ),
                );
              }),
        ),
      );
}
