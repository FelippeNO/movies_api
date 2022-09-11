import 'package:dartz/dartz.dart';
import 'package:desafio_tokenlab/core_module/error_handling/core_failure.dart';
import 'package:desafio_tokenlab/core_module/error_handling/core_success.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/movie_snapshot_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/proxy/proxy_movie_snapshot_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/i_repositories/i_cached_movie_repository.dart';
import 'package:desafio_tokenlab/movie_module/domain/services/save_cached_movies_snapshot_service.dart';
import 'package:desafio_tokenlab/movie_module/error_handling/failures.dart';
import 'package:desafio_tokenlab/movie_module/error_handling/success.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCachedMovieRepository extends Mock with ICachedMovieRepository {}

void main() {
  late final ICachedMovieRepository repository;
  late final SaveCachedMoviesSnapshotService service;

  setUpAll(() {
    repository = MockCachedMovieRepository();
    service = SaveCachedMoviesSnapshotService(repository);
  });

  final List<MovieSnapshotEntity> tMovies = ProxyMovieSnapshotEntity.generateList();

  test('Should return a Success on successful return from the repository', () async {
    when(() => repository.saveCachedMoviesSnapshot(movies: tMovies))
        .thenAnswer((_) async => Right(SaveCachedMoviesSnapshotSuccess()));
    final Either<CoreFailure, CoreSuccess> result = await service.call(movies: tMovies);
    expect(result, Right(SaveCachedMoviesSnapshotSuccess()));
    verify(() => repository.saveCachedMoviesSnapshot(movies: tMovies)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('Should return a Failure on unsuccessful return from the repository', () async {
    when(() => repository.saveCachedMoviesSnapshot(movies: tMovies))
        .thenAnswer((_) async => Left(SaveCachedMoviesSnapshotFailure()));
    final Either<CoreFailure, CoreSuccess> result = await service.call(movies: tMovies);
    expect(result, Left(SaveCachedMoviesSnapshotFailure()));
    verify(() => repository.saveCachedMoviesSnapshot(movies: tMovies)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
