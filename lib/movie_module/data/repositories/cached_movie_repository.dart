import '../../../core_module/error_handling/core_success.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/entities/movie_snapshot_entity.dart';
import '../../../core_module/error_handling/core_failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/i_repositories/i_cached_movie_repository.dart';
import '../../error_handling/exceptions.dart';
import '../../error_handling/failures.dart';
import '../gateways/cached_movie_gateway.dart';

class CachedMovieRepository implements ICachedMovieRepository {
  final ICachedMovieGateway _gateway;

  CachedMovieRepository(this._gateway);

  @override
  Future<Either<CoreFailure, MovieEntity>> getCachedMovieById({required int movieId}) async {
    try {
      final MovieEntity result = await _gateway.getCachedMovieById(movieId: movieId);
      return Right(result);
    } on GetCachedMovieByIdException {
      return Left(GetCachedMovieByIdFailure());
    }
  }

  @override
  Future<Either<CoreFailure, List<MovieSnapshotEntity>>> getCachedMoviesSnapshot() async {
    try {
      final List<MovieSnapshotEntity> result = await _gateway.getCachedMoviesSnapshot();
      return Right(result);
    } on GetCachedMoviesSnapshotException {
      return Left(GetCachedMoviesSnapshotFailure());
    }
  }

  @override
  Future<Either<CoreFailure, CoreSuccess>> saveCachedMoviesSnapshot({required List<MovieSnapshotEntity> movies}) async {
    try {
      final CoreSuccess result = await _gateway.saveCachedMoviesSnapshot(movies: movies);
      return Right(result);
    } on SaveCachedMoviesSnapshotException {
      return Left(SaveCachedMoviesSnapshotFailure());
    }
  }

  @override
  Future<Either<CoreFailure, CoreSuccess>> saveMovieToCache({required MovieEntity movie}) async {
    try {
      final CoreSuccess result = await _gateway.saveMovieToCache(movie: movie);
      return Right(result);
    } on SaveMovieToCacheException {
      return Left(SaveMovieToCacheFailure());
    }
  }
}
