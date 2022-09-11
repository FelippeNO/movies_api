import 'dart:convert';

import 'package:desafio_tokenlab/movie_module/domain/entities/mappers/movie_entity_mapper.dart';
import 'package:flutter/material.dart';

import '../../../core_module/error_handling/core_success.dart';
import '../../domain/entities/mappers/movie_snapshot_entity_mapper.dart';
import '../../domain/entities/movie_snapshot_entity.dart';
import '../../domain/services/get_cached_movies_snapshot_service.dart';
import '../../domain/services/get_movies_snapshot_service.dart';
import '../../domain/services/save_cached_movies_snapshot_service.dart';

class HomeViewController extends ChangeNotifier {
  final GetMoviesSnapshotService _getMoviesSnapshotService;
  final SaveCachedMoviesSnapshotService _saveCachedMoviesSnapshotService;
  final GetCachedMoviesSnapshotService _getCachedMoviesSnapshotService;

  ValueNotifier<bool> areMoviesLoading = ValueNotifier<bool>(true);
  List<MovieSnapshotEntity> _movies = [];

  List<MovieSnapshotEntity> get movies => _movies;

  HomeViewController(
    this._getMoviesSnapshotService,
    this._saveCachedMoviesSnapshotService,
    this._getCachedMoviesSnapshotService,
  );

  void init() async {
    areMoviesLoading.value = true;
    bool hasGotFromCache = await _tryGetFromCache();
    if (hasGotFromCache == false) {
      await _getMoviesFromApi();
    } else {
      areMoviesLoading.value = false;
      areMoviesLoading.notifyListeners();
    }
  }

  Future<bool> _tryGetFromCache() async {
    final serviceRequest = await _getCachedMoviesSnapshotService.call();
    final result = serviceRequest.fold((l) => l, (r) => r);
    if (result is List<MovieSnapshotEntity>) {
      _movies = result;
      return true;
    } else {
      return false;
    }
  }

  Future<void> _getMoviesFromApi() async {
    final serviceRequest = await _getMoviesSnapshotService.call();
    final result = serviceRequest.fold((l) => l, (r) => r);
    if (result is List<MovieSnapshotEntity>) {
      await _saveMoviesToCache(movies: result);
      _movies = result;
      areMoviesLoading.value = false;
      areMoviesLoading.notifyListeners();
    } else {
      print("impossivel pegar da api");
    }
  }

  Future<bool> _saveMoviesToCache({required List<MovieSnapshotEntity> movies}) async {
    final serviceRequest = await _saveCachedMoviesSnapshotService(movies: movies);
    final result = serviceRequest.fold((l) => l, (r) => r);
    return result is CoreSuccess ? true : false;
  }
}
