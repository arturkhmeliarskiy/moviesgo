import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoadingDiscription extends StatefulWidget {
  @override
  LoadingDiscriptionState createState() => LoadingDiscriptionState();
}

class LoadingDiscriptionState extends State<LoadingDiscription>
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
            Container(
              color: HexColor('#f4f4f4'),
              height: 380,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90.0),
                      ),
                      child: ClipPath(
                        clipper: ClippingClass(),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 320.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: Offset(4, 8), // Shadow position
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 258),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(80.0),
                            boxShadow: [
                              BoxShadow(
                                color: HexColor('#9b9b9b'),
                                // blurRadius: 14,
                                // offset: Offset(0, 8), // Shadow position
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50.0),
                                    child: Container(
                                      width: 90,
                                      height: 90,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 330),
                    // color: HexColor('#9b9b9b'),
                    height: 50,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.grey,
                            ),
                            width: 40,
                            height: 40,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.grey,
                            ),
                            width: 40,
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey,
              ),
              width: 150,
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey,
              ),
              width: 150,
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey,
              ),
              width: 150,
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              width: 250,
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey,
                      ),
                      width: 45,
                      height: 45,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey,
                      ),
                      width: 45,
                      height: 45,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey,
                      ),
                      width: 45,
                      height: 45,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey,
              ),
              width: 340,
              height: 120,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
              child: FadeTransition(
                opacity: alpha,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40.0, top: 0, bottom: 40),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey,
                        ),
                        width: 200,
                        height: 130,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40.0, top: 0, bottom: 40),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey,
                        ),
                        width: 200,
                        height: 130,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
