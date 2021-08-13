import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'carousel_item.dart';
import '../loading/loading_collection.dart';
import '../services/movie_services.dart';

class CarouselSliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: MovieSevice().searcMovies('dfdfd'),
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
          items: movies
              .map((e) => CarouselItem(
                  model: e, future: MovieSevice().searcMovies('dfdfd')))
              .toList(),
        );
      });
}
