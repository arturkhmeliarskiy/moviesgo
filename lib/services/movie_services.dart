import 'package:flutter_app/services/genre.dart';
import 'movie_data.dart';
import 'dart:async';
import 'package:dio/dio.dart';

List trendingmovies = [];
final String apikey = '8ec2243bbcaf6f68b4bfd5617cb9e641';
final String redaccesstoken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZWMyMjQzYmJjYWY2ZjY4YjRiZmQ1NjE3Y2I5ZTY0MSIsInN1YiI6IjYxMTU4M2YwMGYwZGE1MDAzMGMzNDRiMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7JFIshtVNqDIv8QqlWo9nyqvrhVDU2vQ9f4lha_0ukQ';

class MovieSevice {
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'api_key=8ec2243bbcaf6f68b4bfd5617cb9e641';
  Future<List<MovieModel>> searcMovies(String query) async {
    try {
      final url = '$baseUrl/movie/now_playing?$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<MovieModel> movieList =
          movies.map((m) => MovieModel.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Genre>> getGenreList() async {
    try {
      final response = await _dio.get('$baseUrl/genre/movie/list?$apiKey');
      var genres = response.data['genres'] as List;
      List<Genre> genreList = genres.map((g) => Genre.fromJson(g)).toList();
      return genreList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
