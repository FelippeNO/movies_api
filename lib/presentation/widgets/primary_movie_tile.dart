import 'package:flutter/material.dart';

class PrimaryMovieTile extends StatelessWidget {
  int id;
  double voteAverage;
  String title;
  String posterUrl;
  List<String> genres;
  String releaseDate;

  PrimaryMovieTile({
    Key? key,
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.posterUrl,
    required this.genres,
    required this.releaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile();
  }
}
