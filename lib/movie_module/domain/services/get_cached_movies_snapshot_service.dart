import 'package:dartz/dartz.dart';

import '../../../core_module/error_handling/core_failure.dart';
import '../entities/movie_snapshot_entity.dart';
import '../i_repositories/i_cached_movie_repository.dart';

class GetCachedMoviesSnapshotService {
  final ICachedMovieRepository _repository;

  GetCachedMoviesSnapshotService(this._repository);

  Future<Either<CoreFailure, List<MovieSnapshotEntity>>> call() async => await _repository.getCachedMoviesSnapshot();
}
