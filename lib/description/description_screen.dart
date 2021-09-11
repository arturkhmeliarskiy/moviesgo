import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/description/cover_movie.dart';
import 'package:flutter_app/description/descrition_movie.dart';
import 'package:flutter_app/description/genre_movie.dart';
import 'package:flutter_app/description/icon_info.dart';
import 'package:flutter_app/description/movie_nems.dart';
import 'package:flutter_app/description/screenshots.dart';
import 'package:flutter_app/header_title/header_title.dart';
import 'package:flutter_app/starr_ating/star_rating.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moviego_models/movie_detail_model.dart';
import 'package:moviego_repositories/movies_repository.dart';

class DescriptionScreen extends StatelessWidget {
  final int model;
  const DescriptionScreen({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var children2 = [
      FutureBuilder(
          future: MoviesRepository().getMovieDetail(model),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: null,
              );
            }
            final mylist = snapshot.data as MovieDetailModel;
            return Column(
              children: [
                CoverMovie(
                    images: mylist.posterpath,
                    trailerId: mylist.trailerId,
                    mylist: mylist),
                Container(
                    margin: EdgeInsets.only(left: 0, top: 20),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                              width: 350, child: MovieNems(name: mylist.title)),
                          GenneMovie(nameGenre: mylist.genres),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            width: 135,
                            child: Row(
                              children: [
                                StarRating(
                                  rating: mylist.voteAverage / 2,
                                  iconSize: 20,
                                  icon: Icons.star,
                                  fontSizes: 16,
                                  marginLeft: 5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 45,
                    width: 250,
                    child: IconInfo(
                      id: mylist.id,
                    )),
                DescritionMovie(
                  descrition: mylist.overview,
                ),
                HeaderTitle(title: 'Screenshots'),
                Screenshots(modelId: mylist.id)
              ],
            );
          })
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'MOVIEGO',
          style: TextStyle(color: HexColor('#ce412e')),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: Container(
        color: HexColor('#f4f4f4'),
        child: SingleChildScrollView(
          child: Column(
            children: children2,
          ),
        ),
      ),
    );
  }
}
