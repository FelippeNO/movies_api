import 'dart:ffi';

import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

Future<List<Movie>> pegarJson() async {
  String baseurl = "https://desafio-mobile.nyc3.digitaloceanspaces.com/movies";

  final data = Uri.parse(baseurl);
  http.Response response = await http.get(data);

  final dados = json.decode(response.body).cast<Map<String, dynamic>>();
  return dados.map<Movie>((json) => Movie.fromJson(json)).toList();
}

Future<MovieData> pegarMovieData(int? movieId) async {
  String baseurl = "https://desafio-mobile.nyc3.digitaloceanspaces.com/movies/" + movieId.toString();

  final data = Uri.parse(baseurl);
  http.Response response = await http.get(data);
  debugPrint(response.body.toString());
  final dados = json.decode(response.body);
  return MovieData.fromJson(dados);
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['vote_average'] = this.voteAverage;
    data['title'] = this.title;
    data['poster_url'] = this.posterUrl;
    data['genres'] = this.genres;
    data['release_date'] = this.releaseDate;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['backdrop_url'] = this.backdropUrl;
    data['budget'] = this.budget;
    data['genres'] = this.genres;
    data['id'] = this.id;
    data['imdb_id'] = this.imdbId;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_url'] = this.posterUrl;
    data['release_date'] = this.releaseDate;
    data['revenue'] = this.revenue;
    data['runtime'] = this.runtime;
    data['status'] = this.status;
    data['tagline'] = this.tagline;
    data['title'] = this.title;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}
