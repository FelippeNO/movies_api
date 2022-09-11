import '../../../../core_module/error_handling/core_exception.dart';
import '../movie_entity.dart';

class MovieEntityMapper {
  static MovieEntity fromJson(Map<String, dynamic> json) {
    try {
      return MovieEntity(
        budget: json['budget'],
        overview: json['overview'],
        popularity: json['popularity'],
        voteCount: json['vote_count'],
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
        'MovieEntityMapper.fromJson',
        exception,
      );
    }
  }
}
