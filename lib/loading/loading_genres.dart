import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/loading/loading_movie.dart';

class LoadingGenres extends StatefulWidget {
  final num n;
  const LoadingGenres({Key? key, required this.n}) : super(key: key);
  @override
  LoadingGenresState createState() => LoadingGenresState();
}

class LoadingGenresState extends State<LoadingGenres>
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
            child: Column(children: [
          LoadingMovie(n: widget.n),
        ])));
  }
}
