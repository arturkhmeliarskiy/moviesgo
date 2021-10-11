import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:moviego_models/movie_model.dart';
import 'package:moviego_repositories/movies_repository.dart';

part 'catergories_event.dart';
part 'catergories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final MoviesRepository _moviesRepository = GetIt.instance.get();

  CategoriesBloc() : super(CategoriesStateLoadingState());

  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    if (event is CategoriesInitializeEvent) {
      List<MovieModel> searchMovies =
          await _moviesRepository.getMoviesByGenreId(event.id);
      final name = event.name;
      yield CategoriesStateSuccessState(searchMovies, name);
    }
  }
}
