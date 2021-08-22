import 'package:flutter/material.dart';
import 'package:flutter_app/slider/carousel_sliders.dart';
import 'package:flutter_app/header_title/header_title.dart';
import 'package:flutter_app/movie_list/movie_list.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moviego_models/genre_model.dart';
import 'package:moviego_repositories/movies_repository.dart';

import 'category/categories_list.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var children2 = [
      CarouselSliders(),
      FutureBuilder(
        future: MoviesRepository().getGenres(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return SizedBox();
          }

          return CategoriesList(
            genres: snapshot.data as List<GenreModel>,
          );
        },
      ),
      HeaderTitle(title: 'My list'),
      MovieList(
        future: MoviesRepository().getPopularMovies(),
      ),
      HeaderTitle(title: 'Comedy'),
      MovieList(
        future: MoviesRepository().getMoviesByGenreId(35),
      ),
    ];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: HexColor('#f4f4f4'),
        appBar: AppBar(
          backgroundColor: HexColor('#f4f4f4'),
          title: Text(
            'MOVIEGO',
            style: TextStyle(color: HexColor('#ce412e')),
          ),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu_sharp),
            onPressed: () {},
            color: HexColor('#555baf'),
            iconSize: 30,
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: HexColor('#555baf'),
              iconSize: 30,
            )
          ],
        ),
        body: Container(
          color: HexColor('#f4f4f4'),
          child: SingleChildScrollView(
            child: Column(
              children: children2,
            ),
          ),
        ),
      ),
    );
  }
}
