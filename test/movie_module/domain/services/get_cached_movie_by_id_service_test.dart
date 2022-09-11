import 'package:dartz/dartz.dart';
import 'package:desafio_tokenlab/core_module/error_handling/core_failure.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/movie_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/proxy/proxy_movie_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/i_repositories/i_cached_movie_repository.dart';
import 'package:desafio_tokenlab/movie_module/domain/services/get_cached_movie_by_id_service.dart';
import 'package:desafio_tokenlab/movie_module/error_handling/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCachedMovieRepository extends Mock with ICachedMovieRepository {}

void main() {
  late final ICachedMovieRepository repository;
  late final GetCachedMovieByIdService service;

  setUpAll(() {
    repository = MockCachedMovieRepository();
    service = GetCachedMovieByIdService(repository);
  });

  final MovieEntity tMovie = ProxyMovieEntity.generateSingle();

  test('Should return a MovieEntity on successful return from the repository', () async {
    when(() => repository.getCachedMovieById(movieId: tMovie.id)).thenAnswer((_) async => Right(tMovie));
    final Either<CoreFailure, MovieEntity> result = await service.call(movieId: tMovie.id);
    expect(result, Right(tMovie));
    verify(() => repository.getCachedMovieById(movieId: tMovie.id)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('Should return a Failure on unsuccessful return from the repository', () async {
    when(() => repository.getCachedMovieById(movieId: tMovie.id))
        .thenAnswer((_) async => Left(GetCachedMovieByIdFailure()));
    final Either<CoreFailure, MovieEntity> result = await service.call(movieId: tMovie.id);
    expect(result, Left(GetCachedMovieByIdFailure()));
    verify(() => repository.getCachedMovieById(movieId: tMovie.id)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
