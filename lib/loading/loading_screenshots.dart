import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreenshots extends StatefulWidget {
  @override
  LoadingCollectionState createState() => LoadingCollectionState();
}

class LoadingCollectionState extends State<LoadingScreenshots>
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
    );
  }
}
