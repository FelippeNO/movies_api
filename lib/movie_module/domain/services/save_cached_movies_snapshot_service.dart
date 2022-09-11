import 'package:dartz/dartz.dart';

import '../../../core_module/error_handling/core_failure.dart';
import '../../../core_module/error_handling/core_success.dart';
import '../entities/movie_snapshot_entity.dart';
import '../i_repositories/i_cached_movie_repository.dart';

class SaveCachedMoviesSnapshotService {
  final ICachedMovieRepository _repository;

  SaveCachedMoviesSnapshotService(this._repository);

  Future<Either<CoreFailure, CoreSuccess>> call({required List<MovieSnapshotEntity> movies}) async =>
      await _repository.saveCachedMoviesSnapshot(movies: movies);
}
