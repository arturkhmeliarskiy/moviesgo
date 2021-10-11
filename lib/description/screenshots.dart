import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Screenshots extends StatelessWidget {
  final List<String> movieImage;

  const Screenshots({
    required this.movieImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 170,
        child: ListView.builder(
          itemCount: movieImage.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              GestureDetector(
                child: Container(
                    width: 200.0,
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
                    margin: EdgeInsets.only(
                      left: 40,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: CachedNetworkImage(
                        imageUrl: movieImage[index],
                        fit: BoxFit.cover,
                        width: 120,
                        height: 130,
                      ),
                    )),
              ),
            ]);
          },
        ),
      );
}
