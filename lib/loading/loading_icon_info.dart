import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIconInfo extends StatefulWidget {
  @override
  LoadingCollectionState createState() => LoadingCollectionState();
}

class LoadingCollectionState extends State<LoadingIconInfo>
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
      child: Container(
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
    );
  }
}
