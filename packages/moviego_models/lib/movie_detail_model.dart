class MovieDetailModel {
  final int id;
  final String title;
  final String backdropPath;
  final String posterpath;
  final List<dynamic> genres;
  final int budget;
  final String homePage;
  final String trailerId;
  final String originalTitle;
  final String overview;
  final DateTime? releaseDate;
  final int runtime;
  final double voteAverage;
  final int voteCount;
  final List<dynamic> productionCountries;

  MovieDetailModel(
      {required this.id,
      required this.title,
      required this.backdropPath,
      required this.posterpath,
      required this.genres,
      required this.trailerId,
      required this.budget,
      required this.homePage,
      required this.originalTitle,
      required this.overview,
      required this.releaseDate,
      required this.runtime,
      required this.voteAverage,
      required this.voteCount,
      required this.productionCountries});
}
