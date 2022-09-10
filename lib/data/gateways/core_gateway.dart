import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/network/http_client_base.dart';
import '../../movie_module/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class CoreGateway {
  static Future<bool> connectionState() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint("CONNECTED");
        return true;
      }
    } on SocketException catch (_) {
      debugPrint("NOT CONNECTED");
      return false;
    }
    return false;
  }

  static Future<void> saveMoviesListToSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString("moviesList") == null) {
      final moviesListUri = HttpClientBase("").httpClient();
      http.Response response = await http.get(moviesListUri);
      prefs.setString("moviesList", response.body.toString());
      debugPrint(response.body);
    }
  }

  static Future<void> saveMovieByIdToSharedPrefs(int? movieId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String movieIdString = movieId.toString();

    if (prefs.getString("movies/" + movieIdString) == null) {
      final movieDataUri = HttpClientBase("/$movieIdString").httpClient();
      http.Response response = await http.get(movieDataUri);
      prefs.setString("movies/" + movieIdString, response.body.toString());
    }
  }

  static Future<List<MovieEntity>> getMoviesListFromSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String moviesString = prefs.getString("moviesList").toString();
    final movies = json.decode(moviesString).cast<Map<String, dynamic>>();
    return movies.map<MovieEntity>((json) => MovieEntity.fromJson(json)).toList();
  }

  static Future<MovieEntity> getMovieFromSharedPrefs(int? movieId) async {
    String movieIdString = movieId.toString();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String moviesString = prefs.getString("movies/" + movieIdString).toString();

    final movie = json.decode(moviesString.toString());
    return MovieEntity.fromJson(movie);
  }
}
