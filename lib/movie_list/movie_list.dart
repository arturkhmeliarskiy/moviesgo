import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/star_rating/star_rating.dart';
import 'package:moviego_models/movie_model.dart';

import '../description/description_screen.dart';

class CarouselMovie extends StatefulWidget {
  final List<MovieModel> mylist;

  const CarouselMovie({
    required this.mylist,
    Key? key,
  }) : super(key: key);

  @override
  _CarouselMovieState createState() => _CarouselMovieState();
}

class _CarouselMovieState extends State<CarouselMovie> {
  @override
  Widget build(BuildContext context) => Container(
        height: 200,
        // color: HexColor('#c42a2a'),
        child: ListView.builder(
          itemCount: widget.mylist.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              GestureDetector(
                onTap: () async {
                  Route route = MaterialPageRoute(
                      builder: (context) =>
                          DescriptionScreen(id: widget.mylist[index].id));
                  await Navigator.push(context, route)
                      .then((value) => setState(() {}));
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
                    margin: EdgeInsets.only(
                      left: 40,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: CachedNetworkImage(
                        imageUrl:
                            widget.mylist[index].posterPath,
                        fit: BoxFit.cover,
                        width: 120,
                        height: 150,
                      ),
                    )),
              ),
              Container(
                width: 120.0,
                margin: EdgeInsets.only(
                  top: 10,
                  left: 42,
                ),
                child: Text(
                  widget.mylist[index].title,
                  style: TextStyle(fontSize: 15, color: Theme.of(context).selectedRowColor),
                  maxLines: 1,
                ),
              ),
              Container(
                width: 120,
                height: 20,
                margin: EdgeInsets.only(
                  top: 0,
                  left: 40,
                ),
                child: StarRating(
                  rating: double.parse(widget.mylist[index].voteAverage) / 2,
                  iconSize: 16.0,
                  icon: Icons.star,
                  icon2: Icons.star_border,
                  fontSizes: 14,
                  marginLeft: 4,
                ),
              )
            ]);
          },
        ),
      );
}
