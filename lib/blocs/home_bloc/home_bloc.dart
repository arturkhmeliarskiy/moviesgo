import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:moviego_models/genre_model.dart';
import 'package:moviego_models/movie_model.dart';
import 'package:moviego_repositories/movies_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MoviesRepository _moviesRepository = GetIt.instance.get();

  HomeBloc() : super(HomeLoadingState()) {
    add(HomeInitializeEvent());
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeInitializeEvent) {
      _moviesRepository.valueChanged.listen((event) {
        add(LoadMoviesEvent());
        print(event);
      });
    }
    if (event is LoadMoviesEvent) {
      final myListMovies = await _moviesRepository.getMyMovie();
      final moviesComedy = await _moviesRepository.getMoviesByGenreId(35);
      final moviesFantasy = await _moviesRepository.getMoviesByGenreId(14);
      final carouselMovies = await _moviesRepository.getPopularMovies();
      final genres = await _moviesRepository.getGenres();

      yield HomeLoadedState(
          carouselMovies, genres, myListMovies, moviesComedy, moviesFantasy);
    }
  }
}
