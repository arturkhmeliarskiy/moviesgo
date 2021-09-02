import 'package:flutter/material.dart';
import 'package:flutter_app/search/MovieItem.dart';
import 'package:moviego_models/movie_model.dart';

class MovieList extends StatelessWidget {
  final List<MovieModel>? movies;
  final Function itemClick;

  MovieList({required this.movies, required this.itemClick});

  @override
  Widget build(context) {
    return new Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: this.movies!.length,
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
                  child: MovieItem(movie: this.movies![index]),
                  onTap: () => this.itemClick(this.movies![index]));
            }));
  }
}
