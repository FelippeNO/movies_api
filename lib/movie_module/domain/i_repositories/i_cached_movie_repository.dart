import 'package:dartz/dartz.dart';

import '../../../core_module/error_handling/core_failure.dart';
import '../../../core_module/error_handling/core_success.dart';
import '../entities/movie_entity.dart';
import '../entities/movie_snapshot_entity.dart';

abstract class ICachedMovieRepository {
  Future<Either<CoreFailure, List<MovieSnapshotEntity>>> getCachedMoviesSnapshot();
  Future<Either<CoreFailure, MovieEntity>> getCachedMovieById({required int movieId});
  Future<Either<CoreFailure, CoreSuccess>> saveMovieByIdToCache({required int movieId});
  Future<Either<CoreFailure, CoreSuccess>> saveCachedMoviesSnapshot({required List<MovieSnapshotEntity> movies});
}
