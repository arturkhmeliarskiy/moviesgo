import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/description/description_screen.dart';
import 'package:moviego_models/movie_model.dart';

class CarouselItem extends StatelessWidget {
  final MovieModel model;

  const CarouselItem({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Route route = MaterialPageRoute(
              builder: (context) => DescriptionScreen(
                    id: model.id,
                  ));
          Navigator.push(context, route);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                blurRadius: 8,
                offset: Offset(0, 10), // Shadow position
              ),
            ],
          ),
          margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 20),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl:
                        model.backdropPath,
                    fit: BoxFit.cover,
                    width: 1000.0,
                    fadeInDuration: Duration.zero,
                    fadeOutDuration: Duration.zero,
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                  ),
                ],
              )),
        ),
      );
}
