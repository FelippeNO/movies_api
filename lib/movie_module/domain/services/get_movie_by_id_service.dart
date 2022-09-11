import 'package:dartz/dartz.dart';
import 'package:desafio_tokenlab/movie_module/data/repositories/movie_repository.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/movie_entity.dart';

import '../../../core_module/error_handling/core_failure.dart';
import '../i_repositories/i_movie_repository.dart';

class GetMovieByIdService {
  final IMovieRepository _repository;

  GetMovieByIdService(this._repository);

  Future<Either<CoreFailure, MovieEntity>> call({required int movieId}) async =>
      await _repository.getMovieById(movieId: movieId);
}
