import 'package:dartz/dartz.dart';
import 'package:desafio_tokenlab/core_module/utils/proxier.dart';
import 'package:desafio_tokenlab/movie_module/data/gateways/cached_movie_gateway.dart';
import 'package:desafio_tokenlab/movie_module/data/repositories/cached_movie_repository.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/movie_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/movie_snapshot_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/proxy/proxy_movie_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/proxy/proxy_movie_snapshot_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/i_repositories/i_cached_movie_repository.dart';
import 'package:desafio_tokenlab/movie_module/error_handling/exceptions.dart';
import 'package:desafio_tokenlab/movie_module/error_handling/failures.dart';
import 'package:desafio_tokenlab/movie_module/error_handling/success.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCachedMovieGateway extends Mock with ICachedMovieGateway {}

void main() {
  late ICachedMovieGateway gateway;
  late ICachedMovieRepository repository;

  setUpAll(() {
    gateway = MockCachedMovieGateway();
    repository = CachedMovieRepository(gateway);
  });

  final int tMovieId = proxyInt;
  final MovieEntity tMovieEntity = ProxyMovieEntity.generateSingle();
  final List<MovieSnapshotEntity> tMovies = ProxyMovieSnapshotEntity.generateList();

  group('CachedMovieRepository.getCachedMoviesSnapshot', () {
    test('Should return a List<MovieSnapshotEntity> on success', () async {
      when(() => gateway.getCachedMoviesSnapshot()).thenAnswer((_) async => tMovies);
      final result = await repository.getCachedMoviesSnapshot();
      expect(result, Right(tMovies));
      verify(() => gateway.getCachedMoviesSnapshot()).called(1);
      verifyNoMoreInteractions(gateway);
    });
    test('Should return a GetCachedMoviesSnapshotFailure on unsuccess', () async {
      when(() => gateway.getCachedMoviesSnapshot())
          .thenThrow(GetCachedMoviesSnapshotException(StackTrace.empty, '', Exception()));
      final result = await repository.getCachedMoviesSnapshot();
      expect(result, Left(GetCachedMoviesSnapshotFailure()));
      verify(() => gateway.getCachedMoviesSnapshot()).called(1);
      verifyNoMoreInteractions(gateway);
    });
  });

  group('CachedMovieRepository.getCachedMovieById', () {
    test('Should return a MovieEntity on success', () async {
      when(() => gateway.getCachedMovieById(movieId: tMovieId)).thenAnswer((_) async => tMovieEntity);
      final result = await repository.getCachedMovieById(movieId: tMovieId);
      expect(result, Right(tMovieEntity));
      verify(() => gateway.getCachedMovieById(movieId: tMovieId)).called(1);
      verifyNoMoreInteractions(gateway);
    });
    test('Should return a GetCachedMovieByIdFailure on unsuccess', () async {
      when(() => gateway.getCachedMovieById(movieId: tMovieId))
          .thenThrow(GetCachedMovieByIdException(StackTrace.empty, '', Exception()));
      final result = await repository.getCachedMovieById(movieId: tMovieId);
      expect(result, Left(GetCachedMovieByIdFailure()));
      verify(() => gateway.getCachedMovieById(movieId: tMovieId)).called(1);
      verifyNoMoreInteractions(gateway);
    });
  });

  group('CachedMovieRepository.saveMovieByIdToCache', () {
    test('Should return a Success on success', () async {
      when(() => gateway.saveMovieByIdToCache(movieId: tMovieId))
          .thenAnswer((_) async => SaveMovieByIdToCacheSuccess());
      final result = await repository.saveMovieByIdToCache(movieId: tMovieId);
      expect(result, Right(SaveMovieByIdToCacheSuccess()));
      verify(() => gateway.saveMovieByIdToCache(movieId: tMovieId)).called(1);
      verifyNoMoreInteractions(gateway);
    });
    test('Should return a SaveMovieByIdToCacheFailure on unsuccess', () async {
      when(() => gateway.saveMovieByIdToCache(movieId: tMovieId))
          .thenThrow(SaveMovieByIdToCacheException(StackTrace.empty, '', Exception()));
      final result = await repository.saveMovieByIdToCache(movieId: tMovieId);
      expect(result, Left(SaveMovieByIdToCacheFailure()));
      verify(() => gateway.saveMovieByIdToCache(movieId: tMovieId)).called(1);
      verifyNoMoreInteractions(gateway);
    });
  });

  group('CachedMovieRepository.saveCachedMoviesSnapshot', () {
    test('Should return a Success on success', () async {
      when(() => gateway.saveCachedMoviesSnapshot()).thenAnswer((_) async => SaveCachedMoviesSnapshotSuccess());
      final result = await repository.saveCachedMoviesSnapshot();
      expect(result, Right(SaveCachedMoviesSnapshotSuccess()));
      verify(() => gateway.saveCachedMoviesSnapshot()).called(1);
      verifyNoMoreInteractions(gateway);
    });
    test('Should return a SaveCachedMoviesSnapshotFailure on unsuccess', () async {
      when(() => gateway.saveCachedMoviesSnapshot())
          .thenThrow(SaveCachedMoviesSnapshotException(StackTrace.empty, '', Exception()));
      final result = await repository.saveCachedMoviesSnapshot();
      expect(result, Left(SaveCachedMoviesSnapshotFailure()));
      verify(() => gateway.saveCachedMoviesSnapshot()).called(1);
      verifyNoMoreInteractions(gateway);
    });
  });
}
