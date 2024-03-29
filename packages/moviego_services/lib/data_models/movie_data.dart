class MovieData {
  final String backdropPath;
  final int id;
  final List<dynamic> genreIds;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final num popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final int voteCount;
  final String voteAverage;

  String? error;

  MovieData({
    this.backdropPath = '',
    this.id = 0,
    this.genreIds = const [],
    this.originalLanguage = '',
    this.originalTitle = '',
    this.overview = '',
    this.popularity = 0,
    this.posterPath = '',
    this.releaseDate = '',
    this.title = '',
    this.video = false,
    this.voteCount = 0,
    this.voteAverage = '',
  });

  factory MovieData.fromJson(dynamic json) {
    if (json == null) {
      return MovieData();
    }

    return MovieData(
        backdropPath: json['backdrop_path'] ?? '',
        id: json['id'] ?? 0,
        genreIds: json['genre_ids'] ?? [],
        originalLanguage: json['original_language'] ?? '',
        originalTitle: json['original_title'] ?? '',
        overview: json['overview'] ?? '',
        popularity: json['popularity'] ?? 0,
        posterPath: json['poster_path'] ?? '',
        releaseDate: json['release_date'] ?? '',
        title: json['title'] ?? '',
        video: json['video'] ?? '',
        voteCount: json['vote_count'] ?? '',
        voteAverage: json['vote_average'].toString());
  }
}
