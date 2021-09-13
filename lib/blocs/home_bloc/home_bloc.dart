import 'package:bloc/bloc.dart';
import 'package:moviego_models/genre_model.dart';
import 'package:moviego_models/movie_model.dart';
import 'package:moviego_repositories/movies_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MoviesRepository _moviesRepository = MoviesRepository();

  HomeBloc() : super(HomeLoadingState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeInitializeEvent) {
      final myListMovies = await _moviesRepository.getMyMovie();
      final moviesByGenre = await _moviesRepository.getMoviesByGenreId(35);

      final carouselMovies = await _moviesRepository.getPopularMovies();
      final genres = await _moviesRepository.getGenres();

      yield HomeLoadedState(
        carouselMovies,
        genres,
        myListMovies,
        moviesByGenre,
      );
    }
  }
}
