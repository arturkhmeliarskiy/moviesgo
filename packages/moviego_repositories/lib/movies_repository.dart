
//28 action  12 adventure 16 animation  35 comedy  80 crime

import 'package:moviego_models/genre_model.dart';
import 'package:moviego_models/movie_model.dart';
import 'package:moviego_services/data_models/genre.dart';
import 'package:moviego_services/data_models/movie_data.dart';
import 'package:moviego_services/movies_service.dart';

final _genreImagesMap = <int, String>{
  28: 'https://cdn.datta.store/auxapi/files/image/alcohol_4yyQwsU.png',
  12: 'https://cdn.datta.store/auxapi/files/image/jabon_MZtGaqS.png',
  16: 'https://cdn.datta.store/auxapi/files/image/tos1_5iFYgvH.png',
  35: 'https://cdn.datta.store/auxapi/files/image/mask_BSBfFgx.png',
  80: 'https://cdn.datta.store/auxapi/files/image/virus_akFIjZm.png',
};

class MoviesRepository {
  final MoviesSevice _service = MoviesSevice();

  Future<List<MovieModel>> searchMovies(String query) async {
    final movies = await _service.searcMovies(query);

    return movies.map((e) => e.toModel()).toList();
  }

  Future<List<GenreModel>> getGenres() async {
    final genres = await _service.getGenreList();
    return genres.map((e) => e.toModel()).toList();
  }
}

extension on MovieData {
  MovieModel toModel() => MovieModel(
        backdropPath: backdropPath,
        id: id,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        video: video,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );
}

extension on Genre {
  GenreModel toModel() => GenreModel(
        name: name,
        imageUrl: _genreImagesMap[id] ??
            'https://upload.wikimedia.org/wikipedia/commons/b/b8/P_culture_violet.png',
        id: id,
      );
}
