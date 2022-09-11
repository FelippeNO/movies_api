import 'package:dartz/dartz.dart';
import 'package:desafio_tokenlab/core_module/error_handling/core_failure.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/movie_snapshot_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/proxy/proxy_movie_snapshot_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/i_repositories/i_cached_movie_repository.dart';
import 'package:desafio_tokenlab/movie_module/domain/services/get_cached_movies_snapshot_service.dart';
import 'package:desafio_tokenlab/movie_module/error_handling/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCachedMovieRepository extends Mock with ICachedMovieRepository {}

void main() {
  late final ICachedMovieRepository repository;
  late final GetCachedMoviesSnapshotService service;

  setUpAll(() {
    repository = MockCachedMovieRepository();
    service = GetCachedMoviesSnapshotService(repository);
  });

  List<MovieSnapshotEntity> tMovies = ProxyMovieSnapshotEntity.generateList();

  test('Should return a List<MovieSnapshotEntity> on successful return from the repository', () async {
    when(() => repository.getCachedMoviesSnapshot()).thenAnswer((_) async => Right(tMovies));
    final Either<CoreFailure, List<MovieSnapshotEntity>> result = await service.call();
    expect(result, Right(tMovies));
    verify(() => repository.getCachedMoviesSnapshot()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('Should return a Failure on unsuccessful return from the repository', () async {
    when(() => repository.getCachedMoviesSnapshot()).thenAnswer((_) async => Left(GetCachedMoviesSnapshotFailure()));
    final Either<CoreFailure, List<MovieSnapshotEntity>> result = await service.call();
    expect(result, Left(GetCachedMoviesSnapshotFailure()));
    verify(() => repository.getCachedMoviesSnapshot()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
