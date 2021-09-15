part of 'my_list_bloc.dart';

abstract class MyListState {}

class MyListLoadingState extends MyListState {}

class MyListStateSuccessState extends MyListState {
  final List<MovieModel> myListMovie;
  final deleteMovie;

  MyListStateSuccessState(this.myListMovie, this.deleteMovie);
}

class MyListLoadedState extends MyListState {
  final List<MovieModel> myListMovie;

  MyListLoadedState(this.myListMovie);
}
