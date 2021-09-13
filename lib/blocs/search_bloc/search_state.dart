part of 'search_bloc.dart';

class SearchState {}

class SearchStateLoadingState extends SearchState {}

class SearchStateInitialState extends SearchState {}

class SearchStateSuccessState extends SearchState {
  final List<MovieModel> searchMovies;
  SearchStateSuccessState(this.searchMovies);
}

class SearchStateErrorState extends SearchState {}

class SearchLoadedState extends SearchState {
  final bool isLoading;
  final List<MovieModel> searchMovies;
  final bool hasError;

  SearchLoadedState(this.isLoading, this.searchMovies, this.hasError);
}
