import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/loading/loading_movie_list.dart';
import 'package:flutter_app/services/movie_data.dart';
import 'package:flutter_app/starr_ating/star_rating.dart';
import 'package:hexcolor/hexcolor.dart';

import '../description/description_screen.dart';

class MovieList extends StatelessWidget {
  final Future future;
  const MovieList({
    required this.future,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: LoadingCListMovie(),
          );
        }
        final mylist = snapshot.data as List<MovieModel>;
        return Container(
          height: 240,
          // color: HexColor('#c42a2a'),
          child: ListView.builder(
            itemCount: mylist.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final ratings = mylist[index].popularity;
              return Column(children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => DescriptionScreen(
                            model: mylist[index], future: future));
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
                        child: Image.network(
                          mylist[index].posterPath,
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
                    left: 40,
                  ),
                  child: Text(mylist[index].title,
                      style:
                          TextStyle(fontSize: 15, color: HexColor('#161616'))),
                ),
                Container(
                  width: 100,
                  height: 20,
                  margin: EdgeInsets.only(
                    top: 5,
                    left: 20,
                  ),
                  child: StarRating(
                    rating: ratings,
                    iconSize: 16.0,
                    icon: Icons.star,
                    icon2: Icons.star_border,
                  ),
                )
              ]);
            },
          ),
        );
      });
}
