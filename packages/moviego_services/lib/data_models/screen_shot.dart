import 'package:equatable/equatable.dart';

class Screenshot extends Equatable {
  final double aspect;
  final String imagePath;
  final int height;
  final int width;
  final String countryCode;
  final double voteAverage;
  final int voteCount;

  Screenshot(
      {this.aspect = 0,
      this.imagePath = '',
      this.height = 0,
      this.width = 0,
      this.countryCode = '',
      this.voteAverage = 0,
      this.voteCount = 0});

  factory Screenshot.fromJson(Map<String, dynamic> json) {
    // ignore: unnecessary_null_comparison
    if (json == null) {
      return Screenshot();
    }

    return Screenshot(
      aspect: json['aspect_ratio'] ?? 0,
      imagePath: json['file_path'] ?? '',
      height: json['height'] ?? 0,
      width: json['width'] ?? 0,
      countryCode: json['iso_639_1'] ?? '',
      voteAverage: json['vote_average'] ?? 0,
      voteCount: json['vote_count'] ?? 0,
    );
  }

  @override
  List<Object> get props =>
      [aspect, imagePath, height, width, countryCode, voteAverage, voteCount];
}
