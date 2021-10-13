import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/description/description_screen.dart';
import 'package:flutter_app/star_rating/star_rating.dart';
import 'package:moviego_models/movie_model.dart';

class MovieInfo extends StatelessWidget {
  final MovieModel movie;

  const MovieInfo({
    required this.movie,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, bottom: 25),
      child: Column(children: <Widget>[
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Route route = MaterialPageRoute(
                    builder: (context) => DescriptionScreen(id: movie.id));
                Navigator.push(context, route);
              },
              child: Container(
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        blurRadius: 10,
                        offset: Offset(0, 8), // Shadow position
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: CachedNetworkImage(
                      imageUrl: movie.posterPath,
                      fit: BoxFit.cover,
                      width: 120,
                      height: 150,
                    ),
                  )),
            ),
            Container(
              width: 190,
              margin: EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Container(
                    width: 180.0,
                    margin: EdgeInsets.only(left: 35),
                    child: Text(
                      movie.title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).splashColor),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 20,
                    margin: EdgeInsets.only(left: 0),
                    child: StarRating(
                      rating: double.parse(movie.voteAverage) / 2,
                      iconSize: 16.0,
                      icon: Icons.star,
                      icon2: Icons.star_border,
                      fontSizes: 14,
                      marginLeft: 4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
