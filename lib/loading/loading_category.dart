import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingCategory extends StatefulWidget {
  @override
  LoadingCollectionState createState() => LoadingCollectionState();
}

class LoadingCollectionState extends State<LoadingCategory>
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
      child: Row(
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
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                color: Colors.grey,
              ),
              width: 55,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
