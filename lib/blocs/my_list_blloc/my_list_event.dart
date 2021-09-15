part of 'my_list_bloc.dart';

abstract class MyListEvent {}

class MyListInitializeEvent extends MyListEvent {
  final int id;
  MyListInitializeEvent(this.id);
}
