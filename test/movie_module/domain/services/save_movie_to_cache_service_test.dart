import 'package:dartz/dartz.dart';
import 'package:desafio_tokenlab/core_module/error_handling/core_failure.dart';
import 'package:desafio_tokenlab/core_module/error_handling/core_success.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/movie_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/proxy/proxy_movie_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/i_repositories/i_cached_movie_repository.dart';
import 'package:desafio_tokenlab/movie_module/domain/services/save_movie_to_cache_service.dart';
import 'package:desafio_tokenlab/movie_module/error_handling/failures.dart';
import 'package:desafio_tokenlab/movie_module/error_handling/success.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCachedMovieRepository extends Mock with ICachedMovieRepository {}

void main() {
  late final ICachedMovieRepository repository;
  late final SaveMovieToCacheService service;

  setUpAll(() {
    repository = MockCachedMovieRepository();
    service = SaveMovieToCacheService(repository);
  });

  final MovieEntity tMovie = ProxyMovieEntity.generateSingle();

  test('Should return a Success on successful return from the repository', () async {
    when(() => repository.saveMovieToCache(movie: tMovie)).thenAnswer((_) async => Right(SaveMovieToCacheSuccess()));
    final Either<CoreFailure, CoreSuccess> result = await service.call(movie: tMovie);
    expect(result, Right(SaveMovieToCacheSuccess()));
    verify(() => repository.saveMovieToCache(movie: tMovie)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('Should return a Failure on unsuccessful return from the repository', () async {
    when(() => repository.saveMovieToCache(movie: tMovie)).thenAnswer((_) async => Left(SaveMovieToCacheFailure()));
    final Either<CoreFailure, CoreSuccess> result = await service.call(movie: tMovie);
    expect(result, Left(SaveMovieToCacheFailure()));
    verify(() => repository.saveMovieToCache(movie: tMovie)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
