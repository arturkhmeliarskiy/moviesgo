part of 'my_list_bloc.dart';

abstract class MyListState {}

class MyListLoadingState extends MyListState {}

class MyListStateSuccessState extends MyListState {
  final List<MovieModel> myListMovie;

  MyListStateSuccessState(this.myListMovie);
}

class MyListLoadedState extends MyListState {
  final List<MovieModel> myListMovie;

  MyListLoadedState(this.myListMovie);
}
