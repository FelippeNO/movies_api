import 'package:dartz/dartz.dart';
import 'package:desafio_tokenlab/core_module/error_handling/core_failure.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/movie_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/movie_snapshot_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/proxy/proxy_movie_snapshot_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/i_repositories/i_movie_repository.dart';
import 'package:desafio_tokenlab/movie_module/domain/services/get_movies_snapshot_service.dart';
import 'package:desafio_tokenlab/movie_module/error_handling/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieRepository extends Mock with IMovieRepository {}

void main() {
  late final IMovieRepository repository;
  late final GetMoviesSnapshotService service;

  setUpAll(() {
    repository = MockMovieRepository();
    service = GetMoviesSnapshotService(repository);
  });

  List<MovieSnapshotEntity> tMovies = ProxyMovieSnapshotEntity.generateList();

  test('Should return a List<MovieSnapshotEntity> on successful return from the repository', () async {
    when(() => repository.getMoviesSnapshot()).thenAnswer((_) async => Right(tMovies));
    final Either<CoreFailure, List<MovieSnapshotEntity>> result = await service.call();
    expect(result, Right(tMovies));
    verify(() => repository.getMoviesSnapshot()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('Should return a Failure on unsuccessful return from the repository', () async {
    when(() => repository.getMoviesSnapshot()).thenAnswer((_) async => Left(GetMoviesSnapshotFailure()));
    final Either<CoreFailure, List<MovieSnapshotEntity>> result = await service.call();
    expect(result, Left(GetMoviesSnapshotFailure()));
    verify(() => repository.getMoviesSnapshot()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
