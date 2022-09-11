import '../../domain/entities/mappers/movie_entity_mapper.dart';
import '../../domain/entities/movie_entity.dart';
import '../../error_handling/exceptions.dart';
import '../../../core_module/api/base_http_client.dart';
import '../../domain/entities/mappers/movie_snapshot_entity_mapper.dart';
import '../../domain/entities/movie_snapshot_entity.dart';

abstract class IMovieGateway {
  Future<List<MovieSnapshotEntity>> getMoviesSnapshot();
  Future<MovieEntity> getMovieById({required int movieId});
}

class MovieGateway implements IMovieGateway {
  final IBaseHttpClient _baseHttpClient;

  MovieGateway(this._baseHttpClient);

  @override
  Future<MovieEntity> getMovieById({required int movieId}) async {
    final movieIdString = movieId.toString();
    try {
      final result = await _baseHttpClient.getAsync("/$movieIdString");
      if (result.statusCode != 200) {
        throw GetMovieByIdException(StackTrace.current, 'MovieGateway.getMovieById', "StatusCode =! 200");
      }
      return MovieEntityMapper.fromJson(result.data);
    } catch (exception, stacktrace) {
      throw GetMovieByIdException(stacktrace, 'MovieGateway.getMovieById', exception);
    }
  }

  @override
  Future<List<MovieSnapshotEntity>> getMoviesSnapshot() async {
    try {
      final result = await _baseHttpClient.getAsync("");
      if (result.statusCode != 200) {
        throw GetMoviesSnapshotException(StackTrace.current, 'MovieGateway.getMoviesSnapshot', "StatusCode =! 200");
      }
      return (result.data as List).map((movieSnapshot) => MovieSnapshotEntityMapper.fromJson(movieSnapshot)).toList();
    } catch (exception, stacktrace) {
      throw GetMoviesSnapshotException(stacktrace, 'MovieGateway.getMoviesSnapshot', exception);
    }
  }
}
