import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/description/cover_movie.dart';
import 'package:flutter_app/description/descrition_movie.dart';
import 'package:flutter_app/description/genre_movie.dart';
import 'package:flutter_app/description/icon_info.dart';
import 'package:flutter_app/description/movie_nems.dart';
import 'package:flutter_app/description/screenshots.dart';
import 'package:flutter_app/header_title/header_title.dart';
import 'package:flutter_app/services/movie_services.dart';
import 'package:flutter_app/starr_ating/star_rating.dart';
import 'package:hexcolor/hexcolor.dart';

class DescriptionScreen extends StatelessWidget {
  final Future future;
  final MovieModel model;
  const DescriptionScreen({Key? key, required this.model, required this.future})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var hexColor = HexColor('#ce412e');
    var children2 = [
      CoverMovie(
        images: model.imageUrl,
      ),
      Container(
          margin: EdgeInsets.only(left: 0, top: 20),
          child: Center(
            child: Column(
              children: [
                MovieNems(name: model.title),
                GenneMovie(name: model.genre),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  width: 120,
                  child: Center(
                    child: StarRating(
                      rating: model.stars,
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
            IconInfo(name: 'Year', name2: model.year),
            IconInfo(name: 'Country', name2: model.country),
            IconInfo(name: 'Lenght', name2: model.lenght),
          ],
        ),
      ),
      DescritionMovie(
        descrition:
            "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
      ),
      HeaderTitle(title: 'Screenshots'),
      Screenshots(screenshots: model.screenshots, future: future)
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
