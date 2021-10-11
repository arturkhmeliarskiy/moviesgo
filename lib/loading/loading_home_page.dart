import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingHomePage extends StatefulWidget {
  @override
  LoadingHomePageState createState() => LoadingHomePageState();
}

class LoadingHomePageState extends State<LoadingHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> alpha;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
    );

    alpha = Tween<double>(begin: 1.0, end: 0.3).animate(controller);

    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: alpha,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: Colors.grey,
                    ),
                    width: 20,
                    height: 140,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey,
                    ),
                    height: 200,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      color: Colors.grey,
                    ),
                    width: 20,
                    height: 140,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 36.0, top: 31),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey,
                    ),
                    width: 120,
                    height: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.0, top: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey,
                    ),
                    width: 120,
                    height: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.0, top: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey,
                    ),
                    width: 120,
                    height: 50,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey,
                    ),
                    width: 80,
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey,
                    ),
                    width: 50,
                    height: 25,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 36.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey,
                      ),
                      width: 120,
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey,
                      ),
                      width: 120,
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey,
                      ),
                      width: 120,
                      height: 150,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey,
                    ),
                    width: 80,
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey,
                    ),
                    width: 50,
                    height: 25,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 36.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey,
                      ),
                      width: 120,
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey,
                      ),
                      width: 120,
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey,
                      ),
                      width: 120,
                      height: 150,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
