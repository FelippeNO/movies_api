import 'dart:convert';
import '../../core/http_client_base.dart';

import '../../domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoreGateway {
  static Future<List<MovieEntity>> getMoviesList() async {
    final moviesListUri = HttpClientBase("").httpClient();
    http.Response response = await http.get(moviesListUri);

    if (response.statusCode == 200) {
      debugPrint("OK!");
      final movies = json.decode(response.body).cast<Map<String, dynamic>>();
      return movies.map<MovieEntity>((json) => MovieEntity.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies!');
    }
  }

  static Future<MovieEntity> getMovieById(int? movieId) async {
    String movieIdString = movieId.toString();
    final movieDataUri = HttpClientBase("/$movieIdString").httpClient();
    http.Response response = await http.get(movieDataUri);

    if (response.statusCode == 200) {
      debugPrint("OK!");
      final movie = json.decode(response.body.toString());
      return MovieEntity.fromJson(movie);
    } else {
      throw Exception('Failed to load movie!');
    }
  }
}
