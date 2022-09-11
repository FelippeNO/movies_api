import '../../../../core_module/error_handling/core_exception.dart';
import '../movie_snapshot_entity.dart';

class MovieSnapshotEntityMapper {
  static MovieSnapshotEntity fromJson(Map<String, dynamic> json) {
    try {
      return MovieSnapshotEntity(
        id: json[''],
        voteAverage: json[''],
        title: json[''],
        posterUrl: json[''],
        genres: json[''],
        releaseDate: json[''],
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
