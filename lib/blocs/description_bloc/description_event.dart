part of 'description_bloc.dart';

abstract class DescriptionEvent {}

class DescriptionInitializeEvent extends DescriptionEvent {
  final int id;
  DescriptionInitializeEvent(this.id);
}

class AddToFavoritesInitializeEvent extends DescriptionEvent {}

class RemoveFromFavoritesInitializeEvent extends DescriptionEvent {}
