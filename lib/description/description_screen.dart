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
import 'package:moviego_models/movie_model.dart';

class DescriptionScreen extends StatelessWidget {
  final Future future;
  final MovieModel model;
  const DescriptionScreen({Key? key, required this.model, required this.future})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      CoverMovie(
        images: model.posterPath,
      ),
      Container(
          margin: EdgeInsets.only(left: 0, top: 20),
          child: Center(
            child: Column(
              children: [
                MovieNems(name: model.title),
                if (model.genres.isNotEmpty)
                  GenneMovie(nameGenre: model.genres),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  width: 120,
                  child: Center(
                    child: StarRating(
                      rating: model.popularity,
                      iconSize: 24,
                      icon: Icons.star,
                    ),
                  ),
                ),
              ],
            ),
          )),
      Container(
        margin: EdgeInsets.only(top: 10),
        height: 50,
        width: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconInfo(name: 'Year', name2: '2021'),
            IconInfo(name: 'Country', name2: 'USA'),
            IconInfo(name: 'Lenght', name2: '140'),
          ],
        ),
      ),
      DescritionMovie(
        descrition: model.overview,
      ),
      HeaderTitle(title: 'Screenshots'),
      Screenshots(screenshots: [], future: future)
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
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: HexColor('#000000'),
            iconSize: 30,
          )
        ],
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
