import 'package:bloc/bloc.dart';
import 'package:moviego_models/movie_model.dart';
import 'package:moviego_repositories/movies_repository.dart';

part 'my_list_event.dart';
part 'my_list_state.dart';

class MyListBloc extends Bloc<MyListEvent, MyListState> {
  final MoviesRepository _moviesRepository = MoviesRepository();

  MyListBloc() : super(MyListLoadingState());

  @override
  Stream<MyListState> mapEventToState(MyListEvent event) async* {
    if (event is MyListInitializeEvent) {
      final myListMovies = await _moviesRepository.getMyMovie();

      yield MyListStateSuccessState(myListMovies);
    }
  }
}
