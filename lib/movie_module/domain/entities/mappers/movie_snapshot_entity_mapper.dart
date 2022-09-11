import '../../../../core_module/error_handling/core_exception.dart';
import '../movie_snapshot_entity.dart';

class MovieSnapshotEntityMapper {
  static MovieSnapshotEntity fromJson(Map<String, dynamic> json) {
    try {
      return MovieSnapshotEntity(
        id: json['id'],
        voteAverage: json['vote_average'],
        title: json['title'],
        posterUrl: json['poster_url'],
        genres: json['genres'].cast<String>(),
        releaseDate: json['release_date'],
      );
    } catch (exception, stacktrace) {
      throw JsonParsingException(
        stacktrace,
        'MovieSnapshotEntity.fromJson',
        exception,
      );
    }
  }
}
