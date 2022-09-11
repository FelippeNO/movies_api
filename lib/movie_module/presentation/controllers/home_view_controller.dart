import 'dart:convert';

import 'package:desafio_tokenlab/movie_module/domain/entities/mappers/movie_entity_mapper.dart';
import 'package:flutter/material.dart';

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
    final serviceRequest = await _getMoviesSnapshotService.call();
    final result = serviceRequest.fold((l) => l, (r) => r);

    if (result is List<MovieSnapshotEntity>) {
      _movies = result;
      areMoviesLoading.value = false;
      areMoviesLoading.notifyListeners();
      //final serviceRequest2 = await _saveCachedMoviesSnapshotService.call(movies: movies);

      // final getRequest = await _getCachedMoviesSnapshotService.call();
      // final result2 = serviceRequest.fold((l) => l, (r) => r);
      // if (result2 is List<MovieSnapshotEntity>) {
      //   print(result2.length);
      //   print(result2[0].title);
      // }
    } else {
      //   GeneralSnackBar("Este número não está disponível. Tente outro!", Icons.warning_rounded).show();
      //   bool isLoadingSignUpLoading = false;
      //    _signUpButtonIsLoading.sink.add(isLoadingSignUpLoading);
    }
  }

  void tryGetFromCache() async {}
}
