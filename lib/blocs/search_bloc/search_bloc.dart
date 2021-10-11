import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:moviego_models/movie_model.dart';
import 'package:moviego_repositories/movies_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MoviesRepository _moviesRepository = GetIt.instance.get();

  SearchBloc() : super(SearchStateInitialState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchInitializeEvent) {
      yield SearchStateLoadingState();
      List<MovieModel> searchMovies =
          await _moviesRepository.searchMovies(event.query);
      yield SearchStateSuccessState(searchMovies);
    }
  }
}
