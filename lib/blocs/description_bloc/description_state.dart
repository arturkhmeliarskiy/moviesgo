part of 'description_bloc.dart';

class DescriptionState {}

class DescriptionStateLoadingState extends DescriptionState {}

class DescriptionStateSuccessState extends DescriptionState {
  final myListMovie;
  final MovieDetailModel searchMovies;
  DescriptionStateSuccessState(this.searchMovies, this.myListMovie);
}

class DescriptionLoadedState extends DescriptionState {
  final MovieDetailModel searchMovies;
  DescriptionLoadedState(this.searchMovies);
}
