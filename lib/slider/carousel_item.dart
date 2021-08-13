import 'package:flutter/material.dart';
import 'package:flutter_app/description/description_screen.dart';
import 'package:flutter_app/services/movie_services.dart';
import 'package:hexcolor/hexcolor.dart';

class CarouselItem extends StatelessWidget {
  final MovieModel model;
  final Future future;
  const CarouselItem({Key? key, required this.model, required this.future})
      : super(key: key);
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Route route = MaterialPageRoute(
              builder: (context) => DescriptionScreen(
                    model: model,
                    future: future,
                  ));
          Navigator.push(context, route);
        },
        child: Container(
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
          margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 30),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(model.imageUrl,
                      fit: BoxFit.cover, width: 1000.0),
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
