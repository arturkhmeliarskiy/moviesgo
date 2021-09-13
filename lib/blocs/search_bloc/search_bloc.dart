import 'package:bloc/bloc.dart';
import 'package:moviego_models/movie_model.dart';
import 'package:moviego_repositories/movies_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MoviesRepository _moviesRepository = MoviesRepository();

  SearchBloc() : super(SearchStateInitialState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchInitializeEvent) {
      List<MovieModel> searchMovies =
          await _moviesRepository.searchMovies(event.query);
      yield SearchStateSuccessState(searchMovies);
    }
  }
}
