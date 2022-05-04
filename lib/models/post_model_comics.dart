import 'package:desafio_tokenlab/core/http_client_base.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Movie>> getMoviesList() async {
  final moviesListUri = HttpClientBase("").httpClient();
  http.Response response = await http.get(moviesListUri);

  if (response.statusCode == 200) {
    debugPrint("OK!");
    final movies = json.decode(response.body).cast<Map<String, dynamic>>();
    return movies.map<Movie>((json) => Movie.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load movies!');
  }
}

Future<MovieData> getMovieById(int? movieId) async {
  String movieIdString = movieId.toString();
  final movieDataUri = HttpClientBase("/$movieIdString").httpClient();
  http.Response response = await http.get(movieDataUri);

  if (response.statusCode == 200) {
    debugPrint("OK!");
    final movie = json.decode(response.body.toString());
    return MovieData.fromJson(movie);
  } else {
    throw Exception('Failed to load movie!');
  }
}

class Movie {
  int? id;
  double? voteAverage;
  String? title;
  String? posterUrl;
  List<String>? genres;
  String? releaseDate;

  Movie({this.id, this.voteAverage, this.title, this.posterUrl, this.genres, this.releaseDate});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voteAverage = json['vote_average'];
    title = json['title'];
    posterUrl = json['poster_url'];
    genres = json['genres'].cast<String>();
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vote_average'] = voteAverage;
    data['title'] = title;
    data['poster_url'] = posterUrl;
    data['genres'] = genres;
    data['release_date'] = releaseDate;
    return data;
  }
}

class MovieData {
  String? backdropUrl;
  int? budget;
  List<String>? genres;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterUrl;
  String? releaseDate;
  int? revenue;
  int? runtime;
  String? status;
  String? tagline;
  String? title;
  double? voteAverage;
  int? voteCount;

  MovieData(
      {this.backdropUrl,
      this.budget,
      this.genres,
      required this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterUrl,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.status,
      this.tagline,
      this.title,
      this.voteAverage,
      this.voteCount});

  MovieData.fromJson(Map<String, dynamic> json) {
    backdropUrl = json['backdrop_url'];
    budget = json['budget'];
    genres = json['genres'].cast<String>();
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterUrl = json['poster_url'];
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_url'] = backdropUrl;
    data['budget'] = budget;
    data['genres'] = genres;
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_url'] = posterUrl;
    data['release_date'] = releaseDate;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    data['status'] = status;
    data['tagline'] = tagline;
    data['title'] = title;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
