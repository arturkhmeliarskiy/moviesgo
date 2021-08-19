import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/loading/loading_screenshots.dart';
import 'package:hexcolor/hexcolor.dart';

class Screenshots extends StatelessWidget {
  final List screenshots;
  final Future future;

  const Screenshots({
    required this.screenshots,
    required this.future,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: LoadingScreenshots(),
          );
        }
        return Container(
          height: 170,
          child: ListView.builder(
            itemCount: screenshots.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(children: <Widget>[
                GestureDetector(
                  // onTap: () {
                  //   Route route = MaterialPageRoute(
                  //       builder: (context) => DescriptionScreen());
                  //   Navigator.push(context, route);
                  // },
                  child: Container(
                      width: 200.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: HexColor('#9b9b9b'),
                            blurRadius: 10,
                            offset: Offset(0, 12), // Shadow position
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(
                        left: 40,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          screenshots[index],
                          fit: BoxFit.cover,
                          width: 120,
                          height: 130,
                        ),
                      )),
                ),
              ]);
            },
          ),
        );
      });
}
