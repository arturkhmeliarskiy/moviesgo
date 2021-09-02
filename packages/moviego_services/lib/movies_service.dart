import 'package:moviego_services/data_models/movie_detail.dart';
import 'package:moviego_services/data_models/movie_image.dart';

import 'data_models/genre.dart';
import 'data_models/movie_data.dart';
import 'dart:async';
import 'package:dio/dio.dart';

List trendingmovies = [];
final String apikey = '8ec2243bbcaf6f68b4bfd5617cb9e641';
final String redaccesstoken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZWMyMjQzYmJjYWY2ZjY4YjRiZmQ1NjE3Y2I5ZTY0MSIsInN1YiI6IjYxMTU4M2YwMGYwZGE1MDAzMGMzNDRiMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7JFIshtVNqDIv8QqlWo9nyqvrhVDU2vQ9f4lha_0ukQ';

class MoviesSevice {
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'api_key=8ec2243bbcaf6f68b4bfd5617cb9e641';
  Future<List<MovieData>> getPopularMovies() async {
    try {
      final url = '$baseUrl/movie/now_playing?$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<MovieData> movieList =
          movies.map((m) => MovieData.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<MovieData>> searchMovies(String query) async {
    try {
      final response =
          await _dio.get('$baseUrl/search/movie?$apiKey&query=$query');
      var movies = response.data['results'] as List;
      List<MovieData> movieList =
          movies.map((m) => MovieData.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<MovieData>> getMoviesByGenreId(int genreId) async {
    try {
      final url = '$baseUrl/discover/movie?with_genres=$genreId&$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<MovieData> movieList =
          movies.map((m) => MovieData.fromJson(m)).toList();
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

  Future<MovieImage> getMovieImage(int movieId) async {
    try {
      final response =
          await _dio.get('$baseUrl/movie/${movieId.toString()}/images?$apiKey');
      return MovieImage.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<MovieDetailData> getMovieDetail(int movieId) async {
    try {
      final response =
          await _dio.get('$baseUrl/movie/${movieId.toString()}?$apiKey');
      MovieDetailData movieDetail = MovieDetailData.fromJson(response.data);

      movieDetail.trailerId = await getYoutubeId(movieId);

      return movieDetail;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<String> getYoutubeId(int id) async {
    try {
      final response = await _dio.get('$baseUrl/movie/$id/videos?$apiKey');
      var youtubeId = response.data['results'][0]['key'];
      return youtubeId;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
