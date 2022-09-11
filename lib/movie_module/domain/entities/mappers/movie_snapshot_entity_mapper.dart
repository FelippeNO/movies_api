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

  static Map<String, dynamic> toJson(MovieSnapshotEntity entity) {
    try {
      final Map<String, dynamic> json = <String, dynamic>{};
      json['id'] = entity.id;
      json['vote_average'] = entity.voteAverage;
      json['title'] = entity.title;
      json['poster_url'] = entity.posterUrl;
      json['genres'] = entity.genres;
      json['release_date'] = entity.releaseDate;
      return json;
    } catch (exception, stacktrace) {
      throw JsonParsingException(
        stacktrace,
        'MovieSnapshotEntityMapper.toJson',
        exception,
      );
    }
  }
}
