import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingCollection extends StatefulWidget {
  @override
  LoadingCollectionState createState() => LoadingCollectionState();
}

class LoadingCollectionState extends State<LoadingCollection>
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
              height: 180,
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
    );
  }
}
