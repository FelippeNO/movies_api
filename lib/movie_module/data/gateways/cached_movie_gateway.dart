import 'dart:convert';

import '../../../core_module/error_handling/core_success.dart';
import '../../../core_module/internal_storage/base_caching.dart';
import '../../domain/entities/mappers/movie_entity_mapper.dart';
import '../../domain/entities/mappers/movie_snapshot_entity_mapper.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/entities/movie_snapshot_entity.dart';
import 'package:flutter/material.dart';

import 'dart:io';

import '../../error_handling/exceptions.dart';
import '../../error_handling/success.dart';

abstract class ICachedMovieGateway {
  Future<List<MovieSnapshotEntity>> getCachedMoviesSnapshot();
  Future<MovieEntity> getCachedMovieById({required int movieId});
  Future<CoreSuccess> saveMovieToCache({required MovieEntity movie});
  Future<CoreSuccess> saveCachedMoviesSnapshot({required List<MovieSnapshotEntity> movies});
}

class CachedMovieGateway implements ICachedMovieGateway {
  final IBaseCaching _baseCaching;

  CachedMovieGateway(this._baseCaching);

  static Future<bool> connectionState() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint("CONNECTED");
        return true;
      }
    } on SocketException catch (_) {
      debugPrint("NOT CONNECTED");
      return false;
    }
    return false;
  }

  @override
  Future<List<MovieSnapshotEntity>> getCachedMoviesSnapshot() async {
    try {
      final result = await _baseCaching.getFromCache('movies');
      if (result.isNotEmpty) {
        var mapList = jsonDecode(result) as List;
        return (mapList).map((movieSnapshot) {
          return MovieSnapshotEntityMapper.fromJson(movieSnapshot);
        }).toList();
      } else {
        throw GetCachedMoviesSnapshotException(
            StackTrace.current, 'CachedMovieGateway.getCachedMoviesSnapshot', "String is empty");
      }
    } catch (exception, stacktrace) {
      throw GetCachedMoviesSnapshotException(stacktrace, 'CachedMovieGateway.getCachedMoviesSnapshot', exception);
    }
  }

  @override
  Future<CoreSuccess> saveCachedMoviesSnapshot({required List<MovieSnapshotEntity> movies}) async {
    try {
      var movieList = movies.map((e) => MovieSnapshotEntityMapper.toJson(e)).toList();
      String encoded = jsonEncode(movieList);
      final result = await _baseCaching.saveToCache(key: 'movies', value: encoded);
      if (result is SaveToCacheSuccess) {
        return SaveCachedMoviesSnapshotSuccess();
      } else {
        throw SaveCachedMoviesSnapshotException(
            StackTrace.current, 'CachedMovieGateway.saveCachedMoviesSnapshot', "It is not a success");
      }
    } catch (exception, stacktrace) {
      throw SaveCachedMoviesSnapshotException(stacktrace, 'CachedMovieGateway.saveCachedMoviesSnapshot', exception);
    }
  }

  @override
  Future<CoreSuccess> saveMovieToCache({required MovieEntity movie}) async {
    String movieId = movie.id.toString();
    try {
      var movieJson = MovieEntityMapper.toJson(movie);
      String encoded = jsonEncode(movieJson);
      final result = await _baseCaching.saveToCache(key: movieId, value: encoded);
      if (result is SaveToCacheSuccess) {
        return SaveCachedMoviesSnapshotSuccess();
      } else {
        throw SaveCachedMoviesSnapshotException(
            StackTrace.current, 'CachedMovieGateway.saveCachedMoviesSnapshot', "It is not a success");
      }
    } catch (exception, stacktrace) {
      throw SaveCachedMoviesSnapshotException(stacktrace, 'CachedMovieGateway.saveCachedMoviesSnapshot', exception);
    }
  }

  @override
  Future<MovieEntity> getCachedMovieById({required int movieId}) async {
    final movieIdString = movieId.toString();
    try {
      final result = await _baseCaching.getFromCache(movieIdString);
      if (result.isEmpty) {
        throw GetCachedMovieByIdException(StackTrace.current, 'CachedMovieGateway.getCachedMovieById', "It is empty");
      }
      final encodedString = jsonDecode(result);
      return MovieEntityMapper.fromJson(encodedString);
    } catch (exception, stacktrace) {
      throw GetCachedMovieByIdException(stacktrace, 'CachedMovieGateway.getCachedMovieById', exception);
    }
  }
}
