import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/starr_ating/star_rating.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moviego_services/data_models/my_lists.dart';

import '../description/description_screen.dart';

class MyListHome extends StatelessWidget {
  final List<MyLists> myMovies;

  const MyListHome({
    required this.myMovies,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 220,
        child: myMovies.length == 0
            ? Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 36.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey,
                      ),
                      width: 120,
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey,
                      ),
                      width: 120,
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        color: Colors.grey,
                      ),
                      width: 55,
                      height: 150,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: myMovies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) =>
                                DescriptionScreen(model: myMovies[index].id));
                        Navigator.push(context, route);
                      },
                      child: Container(
                          width: 120.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: HexColor('#9b9b9b'),
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
                                  'https://image.tmdb.org/t/p/original/${myMovies[index].posterpath}',
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
                        myMovies[index].title,
                        style:
                            TextStyle(fontSize: 15, color: HexColor('#161616')),
                        maxLines: 2,
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
                        rating: myMovies[index].voteAverage / 2,
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
