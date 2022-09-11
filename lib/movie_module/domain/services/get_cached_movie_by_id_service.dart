import 'package:dartz/dartz.dart';

import '../../../core_module/error_handling/core_failure.dart';
import '../entities/movie_entity.dart';
import '../i_repositories/i_cached_movie_repository.dart';

class GetCachedMovieByIdService {
  final ICachedMovieRepository _repository;

  GetCachedMovieByIdService(this._repository);

  Future<Either<CoreFailure, MovieEntity>> call({required int movieId}) async =>
      await _repository.getCachedMovieById(movieId: movieId);
}
