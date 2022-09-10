import 'package:dartz/dartz.dart';
import 'package:desafio_tokenlab/core_module/utils/proxier.dart';
import 'package:desafio_tokenlab/movie_module/data/gateways/movie_gateway.dart';
import 'package:desafio_tokenlab/movie_module/data/repositories/movie_repository.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/movie_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/movie_snapshot_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/proxy/proxy_movie_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/proxy/proxy_movie_snapshot_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/i_repositories/i_movie_repository.dart';
import 'package:desafio_tokenlab/movie_module/error_handling/exceptions.dart';
import 'package:desafio_tokenlab/movie_module/error_handling/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieGateway extends Mock with IMovieGateway {}

void main() {
  late IMovieGateway gateway;
  late IMovieRepository repository;

  setUpAll(() {
    gateway = MockMovieGateway();
    repository = MovieRepository(gateway);
  });

  final int tMovieId = proxyInt;
  final MovieEntity tMovieEntity = ProxyMovieEntity.generateSingle();
  final List<MovieSnapshotEntity> tMovies = ProxyMovieSnapshotEntity.generateList();

  group('MovieRepository.getMovieById', () {
    test('Should return a MovieEntity on success', () async {
      when(() => gateway.getMovieById(movieId: tMovieId)).thenAnswer((_) async => tMovieEntity);
      final result = await repository.getMovieById(movieId: tMovieId);
      expect(result, Right(tMovieEntity));
      verify(() => gateway.getMovieById(movieId: tMovieId)).called(1);
      verifyNoMoreInteractions(gateway);
    });
    test('Should return a GetMovieByIdFailure on unsuccess', () async {
      when(() => gateway.getMovieById(movieId: tMovieId))
          .thenThrow(GetMovieByIdException(StackTrace.empty, '', Exception()));
      final result = await repository.getMovieById(movieId: tMovieId);
      expect(result, Left(GetMovieByIdFailure()));
      verify(() => gateway.getMovieById(movieId: tMovieId)).called(1);
      verifyNoMoreInteractions(gateway);
    });
  });

  group('MovieRepository.getMoviesSnapshot', () {
    test('Should return a List<MovieSnapshotEntity> on success', () async {
      when(() => gateway.getMoviesSnapshot()).thenAnswer((_) async => tMovies);
      final result = await repository.getMoviesSnapshot();
      expect(result, Right(tMovies));
      verify(() => gateway.getMoviesSnapshot()).called(1);
      verifyNoMoreInteractions(gateway);
    });
    test('Should return a GetMoviesSnapshotFailure on unsuccess', () async {
      when(() => gateway.getMoviesSnapshot()).thenThrow(GetMoviesSnapshotException(StackTrace.empty, '', Exception()));
      final result = await repository.getMoviesSnapshot();
      expect(result, Left(GetMoviesSnapshotFailure()));
      verify(() => gateway.getMoviesSnapshot()).called(1);
      verifyNoMoreInteractions(gateway);
    });
  });
}
