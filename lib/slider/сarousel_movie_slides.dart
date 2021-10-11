import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:moviego_models/movie_model.dart';
import 'carousel_item.dart';

class CarouselMovieSlides extends StatelessWidget {
  final List<MovieModel> movies;

  const CarouselMovieSlides({
    required this.movies,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CarouselSlider(
        options: CarouselOptions(
          autoPlay: false,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: movies.map((e) => CarouselItem(model: e)).toList(),
      );
}
