import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingMovie extends StatefulWidget {
  final num n;
  const LoadingMovie({Key? key, required this.n}) : super(key: key);
  @override
  LoadingMovietSate createState() => LoadingMovietSate();
}

class LoadingMovietSate extends State<LoadingMovie>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0, left: 20, bottom: 0),
      child: Column(children: <Widget>[
        for (int i = 0; i < widget.n; i++)
          Container(
            margin: EdgeInsets.only(bottom: 25),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey,
                  ),
                  width: 120,
                  height: 140,
                ),
                Container(
                  width: 190,
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Container(
                        width: 180.0,
                        margin: EdgeInsets.only(left: 35),
                        child: Container(
                          margin: EdgeInsets.only(top: 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.grey,
                          ),
                          width: 70,
                          height: 15,
                        ),
                      ),
                      Container(
                        width: 180.0,
                        margin: EdgeInsets.only(left: 35),
                        child: Container(
                          margin: EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.grey,
                          ),
                          width: 70,
                          height: 15,
                        ),
                      ),
                      Container(
                        width: 180.0,
                        margin: EdgeInsets.only(left: 35),
                        child: Container(
                          margin: EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.grey,
                          ),
                          width: 70,
                          height: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ]),
    );
  }
}
