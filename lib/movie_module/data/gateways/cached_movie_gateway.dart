import '../../../core_module/error_handling/core_success.dart';
import '../../domain/entities/movie_snapshot_entity.dart';
import 'package:flutter/material.dart';

import 'dart:io';

abstract class ICachedMovieGateway {
  Future<List<MovieSnapshotEntity>> getCachedMoviesSnapshot();
  Future<MovieSnapshotEntity> getCachedMovieById({required int movieId});

  Future<CoreSuccess> saveMovieByIdToCache({required int movieId});
  Future<CoreSuccess> saveCachedMoviesSnapshot();
}

class CachedMovieGateway implements ICachedMovieGateway {
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
  Future<MovieSnapshotEntity> getCachedMovieById({required int movieId}) {
    // TODO: implement getCachedMovie
    throw UnimplementedError();
  }

  @override
  Future<List<MovieSnapshotEntity>> getCachedMoviesSnapshot() {
    // TODO: implement getCachedMoviesSnapshot
    throw UnimplementedError();
  }

  @override
  Future<CoreSuccess> saveCachedMoviesSnapshot() {
    // TODO: implement saveCachedMoviesSnapshot
    throw UnimplementedError();
  }

  @override
  Future<CoreSuccess> saveMovieByIdToCache({required int movieId}) {
    // TODO: implement saveMovieToCache
    throw UnimplementedError();
  }
}
