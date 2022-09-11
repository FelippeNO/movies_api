import '../../../../core_module/error_handling/core_exception.dart';
import '../movie_entity.dart';

class MovieEntityMapper {
  static MovieEntity fromJson(Map<String, dynamic> json) {
    try {
      return MovieEntity(
        budget: json[''],
        overview: json[''],
        popularity: json[''],
        voteCount: json[''],
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
        'MovieEntityMapper.fromJson',
        exception,
      );
    }
  }
}
