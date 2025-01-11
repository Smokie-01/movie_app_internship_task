import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:movie_app_task/model/movie_model.dart';

class MovieApiService {
  final String _baseUrl = "https://api.tvmaze.com/search/shows?q=all";

  Future<List<MovieModel>> getMovies() async {
    final response = await http.get(Uri.parse(_baseUrl));
    List<MovieModel> movies = []; // List to store movies

    try {
      if (response.statusCode == 200) {
        log("response came");
        final List<dynamic> data = jsonDecode(response.body);

        movies = data.map((item) => MovieModel.fromJson(item)).toList();

        return movies;
      } else {
        log("Failed to fetch movies. Status code: ${response.statusCode}");
        throw Exception("Failed to fetch movies");
      }
    } catch (e) {
      log("Error while fetching or decoding movies: $e");
      rethrow;
    }
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await http.get(Uri.parse("$_baseUrl&q=$query"));
    List<MovieModel> serachMoviesList = []; // List to store movies

    try {
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        serachMoviesList =
            data.map((item) => MovieModel.fromJson(item)).toList();

        return serachMoviesList;
      } else {
        log("Failed to fetch movies. Status code: ${response.statusCode}");
        throw Exception("Failed to fetch movies");
      }
    } catch (e) {
      log("Error while fetching or decoding movies: $e");
      rethrow;
    }
  }
}
