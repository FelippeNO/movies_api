import 'package:flutter/material.dart';

import '../../../core_module/error_handling/core_success.dart';
import '../../../core_module/utils/widgets/general_snackbar.dart';
import '../../domain/entities/movie_snapshot_entity.dart';
import '../../domain/services/get_cached_movies_snapshot_service.dart';
import '../../domain/services/get_movies_snapshot_service.dart';
import '../../domain/services/save_cached_movies_snapshot_service.dart';

enum HomeViewState { loading, success, failure }

class HomeViewController extends ChangeNotifier {
  final GetMoviesSnapshotService _getMoviesSnapshotService;
  final SaveCachedMoviesSnapshotService _saveCachedMoviesSnapshotService;
  final GetCachedMoviesSnapshotService _getCachedMoviesSnapshotService;

  ValueNotifier<HomeViewState> state = ValueNotifier<HomeViewState>(HomeViewState.loading);
  List<MovieSnapshotEntity> _movies = [];

  List<MovieSnapshotEntity> get movies => _movies;

  HomeViewController(
    this._getMoviesSnapshotService,
    this._saveCachedMoviesSnapshotService,
    this._getCachedMoviesSnapshotService,
  );

  void init() async {
    state.value = HomeViewState.loading;
    bool hasGotFromCache = await _tryGetFromCache();
    if (hasGotFromCache == false) {
      await _getMoviesFromApi();
    } else {
      GeneralSnackBar("Filmes carregados do cachê").show();
      state.value = HomeViewState.success;
      state.notifyListeners();
    }
  }

  Future<bool> _tryGetFromCache() async {
    final serviceRequest = await _getCachedMoviesSnapshotService.call();
    final result = serviceRequest.fold((l) => l, (r) => r);
    if (result is List<MovieSnapshotEntity>) {
      _movies = result;
      return true;
    } else {
      GeneralSnackBar("Não há filmes no cachê, vamos buscar na internet!").show();
      return false;
    }
  }

  Future<void> _getMoviesFromApi() async {
    final serviceRequest = await _getMoviesSnapshotService.call();
    final result = serviceRequest.fold((l) => l, (r) => r);
    if (result is List<MovieSnapshotEntity>) {
      await _saveMoviesToCache(movies: result);
      _movies = result;
      state.value = HomeViewState.success;
      state.notifyListeners();
    } else {
      state.value = HomeViewState.failure;
      state.notifyListeners();
      GeneralSnackBar("Não foi possível pegar filmes da internet!").show();
    }
  }

  Future<bool> _saveMoviesToCache({required List<MovieSnapshotEntity> movies}) async {
    final serviceRequest = await _saveCachedMoviesSnapshotService(movies: movies);
    final result = serviceRequest.fold((l) => l, (r) => r);
    return result is CoreSuccess ? true : false;
  }
}
