class MovieSnapshotEntity {
  final int id;
  final double voteAverage;
  final String title;
  final String posterUrl;
  final List<String> genres;
  final String releaseDate;

  MovieSnapshotEntity({
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.posterUrl,
    required this.genres,
    required this.releaseDate,
  });
}
