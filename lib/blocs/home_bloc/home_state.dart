part of 'home_bloc.dart';

abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<MovieModel> carouselMovies;
  final List<GenreModel> genres;
  final List<MovieModel> myListMovies;
  final List<MovieModel> moviesByGenre;

  HomeLoadedState(
    this.carouselMovies,
    this.genres,
    this.myListMovies,
    this.moviesByGenre,
  );
}
