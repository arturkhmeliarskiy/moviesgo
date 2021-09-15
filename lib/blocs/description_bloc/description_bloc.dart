import 'package:bloc/bloc.dart';
import 'package:moviego_models/movie_detail_model.dart';
import 'package:moviego_repositories/movies_repository.dart';
part 'description_event.dart';
part 'description_state.dart';

class DescriptionBloc extends Bloc<DescriptionEvent, DescriptionState> {
  final MoviesRepository _moviesRepository = MoviesRepository();

  DescriptionBloc() : super(DescriptionStateLoadingState());

  @override
  Stream<DescriptionState> mapEventToState(DescriptionEvent event) async* {
    if (event is DescriptionInitializeEvent) {
      MovieDetailModel searchMovies =
          await _moviesRepository.getMovieDetail(event.id);
      var myListMovie = await _moviesRepository.getMyListMovieID(event.id);
      yield DescriptionStateSuccessState(searchMovies, myListMovie);
    }
  }
}
