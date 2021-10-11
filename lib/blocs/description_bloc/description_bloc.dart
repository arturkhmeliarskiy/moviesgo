import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:moviego_models/movie_detail_model.dart';
import 'package:moviego_repositories/movies_repository.dart';
part 'description_event.dart';
part 'description_state.dart';

class DescriptionBloc extends Bloc<DescriptionEvent, DescriptionState> {
  final MoviesRepository _moviesRepository = GetIt.instance.get();
  late MovieDetailModel _movie;
  DescriptionBloc() : super(DescriptionStateLoadingState());

  @override
  Stream<DescriptionState> mapEventToState(DescriptionEvent event) async* {
    if (event is DescriptionInitializeEvent) {
      _movie = await _moviesRepository.getMovieDetail(event.id);
      final isFavorit = await _moviesRepository.getMyListMovieID(event.id);
      final screenshots = await _moviesRepository.getBackdropsImages(event.id);
      yield DescriptionStateSuccessState(
          isFavorit != null, _movie, screenshots);
    }
    if (event is AddToFavoritesInitializeEvent) {
      await _moviesRepository.addMovie(_movie);
    }
    if (event is RemoveFromFavoritesInitializeEvent) {
      await _moviesRepository.deleteMyMovieID(_movie.id);
    }
  }
}
