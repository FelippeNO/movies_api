import 'package:desafio_tokenlab/movie_module/data/gateways/movie_gateway.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/movie_snapshot_entity.dart';

import 'package:desafio_tokenlab/core_module/error_handling/core_failure.dart';

import 'package:dartz/dartz.dart';

import '../../domain/entities/movie_entity.dart';
import '../../domain/i_repositories/i_movie_repository.dart';
import '../../error_handling/exceptions.dart';
import '../../error_handling/failures.dart';

class MovieRepository implements IMovieRepository {
  final IMovieGateway _gateway;

  MovieRepository(this._gateway);

  @override
  Future<Either<CoreFailure, MovieEntity>> getMovieById({required int movieId}) async {
    try {
      final MovieEntity result = await _gateway.getMovieById(movieId: movieId);
      return Right(result);
    } on GetMovieByIdException {
      return Left(GetMovieByIdFailure());
    }
  }

  @override
  Future<Either<CoreFailure, List<MovieSnapshotEntity>>> getMoviesSnapshot() async {
    try {
      final List<MovieSnapshotEntity> result = await _gateway.getMoviesSnapshot();
      return Right(result);
    } on GetMoviesSnapshotException {
      return Left(GetMoviesSnapshotFailure());
    }
  }
}
