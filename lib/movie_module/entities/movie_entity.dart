import 'movie_snapshot_entity.dart';

class MovieEntity extends MovieSnapshotEntity {
  final int budget;
  final String overview;
  final double popularity;
  final int voteCount;

  MovieEntity({
    required this.budget,
    required this.overview,
    required this.popularity,
    required this.voteCount,
    required super.id,
    required super.voteAverage,
    required super.title,
    required super.posterUrl,
    required super.genres,
    required super.releaseDate,
  });
}
