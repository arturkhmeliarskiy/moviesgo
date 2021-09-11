import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:moviego_models/movie_model.dart';
import 'carousel_item.dart';

class CarouselSliders extends StatelessWidget {
  final List<MovieModel> movies;

  const CarouselSliders({
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
