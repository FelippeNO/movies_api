import 'package:dartz/dartz.dart';
import '../entities/movie_entity.dart';
import '../../../core_module/error_handling/core_failure.dart';
import '../entities/movie_snapshot_entity.dart';

abstract class IMovieRepository {
  Future<Either<CoreFailure, List<MovieSnapshotEntity>>> getMoviesSnapshot();
  Future<Either<CoreFailure, MovieEntity>> getMovieById({required int movieId});
}
