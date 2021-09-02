import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:moviego_models/movie_model.dart';
import 'package:moviego_repositories/movies_repository.dart';
import 'carousel_item.dart';
import '../loading/loading_collection.dart';

class CarouselSliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: MoviesRepository().getPopularMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: LoadingCollection(),
          );
        }
        final movies = snapshot.data as List<MovieModel>;
        return CarouselSlider(
          options: CarouselOptions(
            autoPlay: false,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: movies.map((e) => CarouselItem(model: e)).toList(),
        );
      });
}
