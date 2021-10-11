part of 'description_bloc.dart';

class DescriptionState {}

class DescriptionStateLoadingState extends DescriptionState {}

class DescriptionStateSuccessState extends DescriptionState {
  final bool isFavorit;
  final MovieDetailModel movie;
  final List<String> screenshots;
  DescriptionStateSuccessState(this.isFavorit, this.movie, this.screenshots);
}
