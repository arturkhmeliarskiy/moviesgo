//28 action  12 adventure 16 animation  35 comedy  80 crime
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:moviego_models/genre_model.dart';
import 'package:moviego_models/movie_model.dart';
import 'package:moviego_models/movie_detail_model.dart';
import 'package:moviego_services/data_models/db_movie.dart';
import 'package:moviego_services/data_models/genre.dart';
import 'package:moviego_services/data_models/movie_data.dart';
import 'package:moviego_services/data_models/movie_detail.dart';
import 'package:moviego_services/database.dart';
import 'package:moviego_services/moviego_services.dart';
import 'package:event/event.dart';

final _genreImagesMap = <int, String>{
  28: 'assets/images/category/action.jpg',
  12: 'assets/images/category/adventure.jpg',
  16: 'assets/images/category/animation.jpg',
  35: 'assets/images/category/comedy.jpg',
  80: 'assets/images/category/crime.png',
  99: 'assets/images/category/documentary.jpg',
  18: 'assets/images/category/drama.png',
  10751: 'assets/images/category/family.jpg',
  14: 'assets/images/category/fantasy.jpg',
  36: 'assets/images/category/history.jpg',
  27: 'assets/images/category/horror.jpg',
  10402: 'assets/images/category/music.png',
  9648: 'assets/images/category/mystery.jpg',
  10749: 'assets/images/category/romance.jpg',
  878: 'assets/images/category/science_fiction.jpeg',
  10770: 'assets/images/category/tv_movie.jpg',
  53: 'assets/images/category/thriller.jpg',
  10752: 'assets/images/category/war.jpg',
  37: 'assets/images/category/western.jpg',
};

class MoviesRepository {
  final MoviesSevice _service = MoviesSevice();
  late List<GenreModel> _genres;
  static ValueChanged? onMyListChanged;

  // final valueChangedEvent = Event();

  final _valueChanged = StreamController<Object>.broadcast();

  Stream<Object> get valueChanged => _valueChanged.stream;

  Future<List<MovieModel>> getPopularMovies() async {
    final movies = await _service.getPopularMovies();
    await _updadeGenres();
    return movies.map((e) => e.toModel(_genres)).toList();
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    final movies = await _service.searchMovies(query);
    await _updadeGenres();
    return movies.map((e) => e.toModel(_genres)).toList();
  }

  Future<List<MovieModel>> getMyMovie() async {
    final tt = await DBProvider.db.getAllMovie();
    return tt
        .map((e) => MovieModel(
              id: e.id,
              title: e.title,
              posterPath: e.posterpath,
              voteAverage: e.voteAverage.toString(),
              backdropPath: '',
              genres: [],
              originalLanguage: '',
              originalTitle: '',
              overview: '',
              popularity: 0,
              releaseDate: '',
              video: false,
              voteCount: 0,
            ))
        .toList();
  }

  Future<void> addMovie(MovieDetailModel movie) async {
    await DBProvider.db.addMovie(DBMovie(
      id: movie.id,
      title: movie.title,
      posterpath: movie.posterpath,
      voteAverage: movie.voteAverage,
    ));
    _valueChanged.add(123);
  }

  Future getMyListMovieID(int id) async {
    final movie = await DBProvider.db.getMovie(id);
    return movie;
  }

  Future<void> deleteMyMovieID(int id) async {
    await DBProvider.db.deleteMovie(id);
    onMyListChanged?.call(0);
    _valueChanged.add('');
  }

  Future<List<GenreModel>> getGenres() async {
    final genres = await _service.getGenreList();
    return genres.map((e) => e.toModel()).toList();
  }

  Future<List<MovieModel>> getMoviesByGenreId(int id) async {
    final movies = await _service.getMoviesByGenreId(id);
    await _updadeGenres();
    return movies.map((e) => e.toModel(_genres)).toList();
  }

  Future<List<String>> getBackdropsImages(int id) async {
    final images = await _service.getMovieImage(id);
    return images.backdrops
        .map((e) => 'https://image.tmdb.org/t/p/original/${e.imagePath}')
        .toList();
  }

  Future<MovieDetailModel> getMovieDetail(int id) async {
    final detail = await _service.getMovieDetail(id);
    return detail.toModel();
  }

  Future<String> getYoutubeId(int id) async {
    final video = await _service.getYoutubeId(id);
    return video;
  }

  Future<void> _updadeGenres() async {
    _genres = await getGenres();
  }
}

extension on MovieData {
  MovieModel toModel(List<GenreModel> allGenres) => MovieModel(
        backdropPath: backdropPath,
        id: id,
        genres: allGenres
            .where((element) => this.genreIds.contains(element.id))
            .toList(),
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity.toInt(),
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        video: video,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );
}

extension on Genre {
  GenreModel toModel() => GenreModel(
        name: name,
        imageUrl: _genreImagesMap[id] ??
            'https://upload.wikimedia.org/wikipedia/commons/b/b8/P_culture_violet.png',
        id: id,
      );
}

extension on MovieDetailData {
  MovieDetailModel toModel() => MovieDetailModel(
      id: id,
      title: title,
      backdropPath: backdropPath,
      posterpath: posterpath,
      genres: genres,
      trailerId: trailerId,
      budget: budget,
      homePage: homePage,
      originalTitle: originalTitle,
      overview: overview,
      releaseDate: DateTime.tryParse(releaseDate),
      runtime: runtime,
      voteAverage: voteAverage,
      voteCount: voteCount,
      productionCountries: productionCountries);
}
