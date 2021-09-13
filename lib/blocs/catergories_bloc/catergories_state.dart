part of 'catergories_bloc.dart';

class CategoriesState {}

class CategoriesStateLoadingState extends CategoriesState {}

class CategoriesStateSuccessState extends CategoriesState {
  final String name;
  final List<MovieModel> searchMovies;
  CategoriesStateSuccessState(this.searchMovies, this.name);
}

class DCategoriesSLoadedState extends CategoriesState {
  final String name;
  final List<MovieModel> searchMovies;
  DCategoriesSLoadedState(this.searchMovies, this.name);
}
