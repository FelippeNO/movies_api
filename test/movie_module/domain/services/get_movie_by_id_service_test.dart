import 'package:dartz/dartz.dart';
import 'package:desafio_tokenlab/core_module/error_handling/core_failure.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/movie_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/proxy/proxy_movie_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/i_repositories/i_movie_repository.dart';
import 'package:desafio_tokenlab/movie_module/domain/services/get_movie_by_id_service.dart';
import 'package:desafio_tokenlab/movie_module/error_handling/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieRepository extends Mock with IMovieRepository {}

void main() {
  late final IMovieRepository repository;
  late final GetMovieByIdService service;

  setUpAll(() {
    repository = MockMovieRepository();
    service = GetMovieByIdService(repository);
  });

  int tMovieId = 240;
  MovieEntity tMovie = ProxyMovieEntity.generateSingle();

  test('Should return a MovieEntity on successful return from the repository', () async {
    when(() => repository.getMovieById(movieId: tMovieId)).thenAnswer((_) async => Right(tMovie));
    final Either<CoreFailure, MovieEntity> result = await service.call(movieId: tMovieId);
    expect(result, Right(tMovie));
    verify(() => repository.getMovieById(movieId: tMovieId)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('Should return a Failure on unsuccessful return from the repository', () async {
    when(() => repository.getMovieById(movieId: tMovieId)).thenAnswer((_) async => Left(GetMovieByIdFailure()));
    final Either<CoreFailure, MovieEntity> result = await service.call(movieId: tMovieId);
    expect(result, Left(GetMovieByIdFailure()));
    verify(() => repository.getMovieById(movieId: tMovieId)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
