part of 'catergories_bloc.dart';

abstract class CategoriesEvent {}

class CategoriesInitializeEvent extends CategoriesEvent {
  final int id;
  final String name;
  CategoriesInitializeEvent(this.id, this.name);
}
