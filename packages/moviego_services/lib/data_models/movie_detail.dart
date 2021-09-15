class MovieDetailData {
  final int id;
  final String title;
  final String backdropPath;
  final String posterpath;
  final List<dynamic> genres;
  final int budget;
  final String homePage;
  final String originalTitle;
  final String overview;
  final String releaseDate;
  final int runtime;
  final double voteAverage;
  final int voteCount;
  final List<dynamic> productionCountries;

  String trailerId;

  String? error;

  MovieDetailData(
      {this.id = 0,
      this.title = '',
      this.backdropPath = '',
      this.posterpath = '',
      this.genres = const [],
      this.trailerId = '',
      this.budget = 0,
      this.homePage = '',
      this.originalTitle = '',
      this.overview = '',
      this.releaseDate = '',
      this.runtime = 0,
      this.voteAverage = 0,
      this.voteCount = 0,
      this.productionCountries = const []});

  factory MovieDetailData.fromJson(dynamic json) {
    if (json == null) {
      return MovieDetailData();
    }

    return MovieDetailData(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        backdropPath: json['backdrop_path'] ?? '',
        posterpath: json['poster_path'] ?? '',
        genres: json['genres'] ?? [],
        productionCountries: json['production_countries'] ?? [],
        budget: json['budget'] ?? 0,
        homePage: json['homepage'] ?? '',
        originalTitle: json['original_title'] ?? '',
        overview: json['overview'] ?? '',
        releaseDate: json['release_date'] ?? '',
        runtime: json['runtime'] ?? 0,
        voteAverage: json['vote_average'] ?? '',
        voteCount: json['vote_count'] ?? 0);
  }
}
