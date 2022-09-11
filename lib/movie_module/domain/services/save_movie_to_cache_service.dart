import 'package:dartz/dartz.dart';

import '../../../core_module/error_handling/core_failure.dart';
import '../../../core_module/error_handling/core_success.dart';
import '../entities/movie_entity.dart';
import '../i_repositories/i_cached_movie_repository.dart';

class SaveMovieToCacheService {
  final ICachedMovieRepository _repository;

  SaveMovieToCacheService(this._repository);

  Future<Either<CoreFailure, CoreSuccess>> call({required MovieEntity movie}) async =>
      await _repository.saveMovieToCache(movie: movie);
}
