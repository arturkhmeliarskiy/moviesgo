part of 'search_bloc.dart';

abstract class SearchEvent {}

class SearchInitializeEvent extends SearchEvent {
  final String query;
  SearchInitializeEvent(this.query);
}
