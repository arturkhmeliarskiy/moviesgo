//28 action  12 adventure 16 animation  35 comedy  80 crime

import 'package:moviego_models/genre_model.dart';
import 'package:moviego_models/movie_model.dart';
import 'package:moviego_models/movie_detail_model.dart';
import 'package:moviego_services/data_models/genre.dart';
import 'package:moviego_services/data_models/movie_data.dart';
import 'package:moviego_services/data_models/movie_detail.dart';
import 'package:moviego_services/moviego_services.dart';

final _genreImagesMap = <int, String>{
  28: 'https://i.ytimg.com/vi/H0ldnevOrUI/maxresdefault.jpg',
  12: 'https://unitingartists.org/wp-content/uploads/2020/06/Adventure-Genre-800x445.jpg',
  16: 'https://i.pinimg.com/originals/b0/10/a9/b010a96947186f31aaa3434f1562fea1.jpg',
  35: 'https://i.pinimg.com/originals/44/bd/0f/44bd0f871fb17f956703a5c2538d71bb.jpg',
  80: 'https://s.studiobinder.com/wp-content/uploads/2019/11/73-Best-Crime-Movies-Featured-StudioBinder-min.jpg',
  99: 'https://ecowarriorprincess.net/wp-content/uploads/2016/11/must-see-green-films-best-environmental-documentaries.jpg',
  18: 'https://freedramamoviesblog.files.wordpress.com/2014/11/free-drama-movies-3.png',
  10751:
      'https://purewows3.imgix.net/images/articles/2019_04/The-Goonies-family-movie.jpg?auto=format,compress&cs=strip',
  14: 'https://www.looper.com/img/gallery/the-best-fantasy-movies-of-all-time-according-to-rotten-tomatoes/intro-1584539545.jpg',
  36: 'https://www.topinspired.com/wp-content/uploads/2015/06/king-arthur.jpg',
  27: 'https://helios-i.mashable.com/imagery/articles/01eIvreZ9sXEnn1jUU6nyQM/images-93.jpg',
  10402:
      'https://pyxis.nymag.com/v1/imgs/283/309/2d75ce5537e36f926ec9aae823dd470267-music-sia.2x.rsocial.w600.jpg',
  9648:
      'https://orion-uploads.openroadmedia.com/md_bcf267e3c946-bestmysteryandthrillermovies2019_feature.jpg',
  10749:
      'https://cdn.onebauer.media/one/empire-images/features/5a84102108d1e196265a9d4f/40-the-notebook.jpg',
  878:
      'https://www.tollywood.net/wp-content/uploads/2018/04/Avengers-Infinity-War.jpeg',
  10770:
      'https://news-cdn.softpedia.com/images/news2/Watch-Movies-and-Trailers-for-Free-with-the-Latest-Popcorn-Time-466428-2.jpg',
  53: 'https://media.timeout.com/images/105168146/image.jpg',
  10752:
      'https://pyxis.nymag.com/v1/imgs/3b6/1b5/809f83e544831f5301bea0398d2a6a489e-08-war-movies-ranking-2.jpg',
  37: 'https://res.cloudinary.com/jerrick/image/upload/f_jpg,fl_progressive,q_auto,w_1024/q3zwj4txrzvt7i1shcxa.jpg',
};

class MoviesRepository {
  final MoviesSevice _service = MoviesSevice();
  late List<GenreModel> _genres;

  Future<List<MovieModel>> getPopularMovies() async {
    final movies = await _service.getPopularMovies();

    await _updadeGenres();

    return movies.map((e) => e.toModel(_genres)).toList();
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    final movies = await _service.searchMovies(query);
    await _updadeGenres();

    return movies.map((e) => e.toModel(_genres)).toList();
  }

  Future<List<GenreModel>> getGenres() async {
    final genres = await _service.getGenreList();
    return genres.map((e) => e.toModel()).toList();
  }

  Future<List<MovieModel>> getMoviesByGenreId(int id) async {
    final movies = await _service.getMoviesByGenreId(id);
    await _updadeGenres();

    return movies.map((e) => e.toModel(_genres)).toList();
  }

  Future<List<String>> getBackdropsImages(int id) async {
    final images = await _service.getMovieImage(id);

    return images.backdrops
        .map((e) => 'https://image.tmdb.org/t/p/original/${e.imagePath}')
        .toList();
  }

  Future<MovieDetailModel> getMovieDetail(int id) async {
    final detail = await _service.getMovieDetail(id);
    return detail.toModel();
  }

  Future<String> getYoutubeId(int id) async {
    final video = await _service.getYoutubeId(id);
    return video;
  }

  Future<void> _updadeGenres() async {
    _genres = await getGenres();
  }
}

extension on MovieData {
  MovieModel toModel(List<GenreModel> allGenres) => MovieModel(
        backdropPath: backdropPath,
        id: id,
        genres: allGenres
            .where((element) => this.genreIds.contains(element.id))
            .toList(),
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity.toInt(),
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

extension on MovieDetailData {
  MovieDetailModel toModel() => MovieDetailModel(
      id: id,
      title: title,
      backdropPath: backdropPath,
      posterpath: posterpath,
      genres: genres,
      trailerId: trailerId,
      budget: budget,
      homePage: homePage,
      originalTitle: originalTitle,
      overview: overview,
      releaseDate: DateTime.tryParse(releaseDate),
      runtime: runtime,
      voteAverage: voteAverage,
      voteCount: voteCount,
      productionCountries: productionCountries);
}
