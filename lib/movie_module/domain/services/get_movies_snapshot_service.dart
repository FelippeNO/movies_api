import 'package:dartz/dartz.dart';

import '../../../core_module/error_handling/core_failure.dart';
import '../entities/movie_snapshot_entity.dart';
import '../i_repositories/i_movie_repository.dart';

class GetMoviesSnapshotService {
  final IMovieRepository _repository;

  GetMoviesSnapshotService(this._repository);

  Future<Either<CoreFailure, List<MovieSnapshotEntity>>> call() async => await _repository.getMoviesSnapshot();
}
