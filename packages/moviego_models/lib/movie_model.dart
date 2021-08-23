import 'package:moviego_models/genre_model.dart';

class MovieModel {
  final String backdropPath;
  final int id;
  final List<GenreModel> genres;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final int popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final int voteCount;
  final String voteAverage;

  MovieModel({
    required this.backdropPath,
    required this.id,
    required this.genres,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteCount,
    required this.voteAverage,
  });
}
