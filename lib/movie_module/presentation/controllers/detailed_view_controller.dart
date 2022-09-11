import 'package:flutter/material.dart';

import '../../../core_module/error_handling/core_success.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/services/get_cached_movie_by_id_service.dart';
import '../../domain/services/get_movie_by_id_service.dart';
import '../../domain/services/save_movie_to_cache_service.dart';

class DetailedViewController extends ChangeNotifier {
  late MovieEntity _movie;
  final GetMovieByIdService _getMovieByIdService;
  final SaveMovieToCacheService _saveMovieToCacheService;
  final GetCachedMovieByIdService _getCachedMovieByIdService;

  ValueNotifier<bool> isMovieLoading = ValueNotifier<bool>(true);

  MovieEntity get movie => _movie;

  DetailedViewController(
    this._getMovieByIdService,
    this._saveMovieToCacheService,
    this._getCachedMovieByIdService,
  );

  void init({required int movieId}) async {
    isMovieLoading.value = true;
    bool hasGotFromCache = await _tryGetMovieFromCache(movieId: movieId);
    if (hasGotFromCache == false) {
      await _getMovieFromApi(movieId: movieId);
    } else {
      isMovieLoading.value = false;
      isMovieLoading.notifyListeners();
    }
  }

  Future<bool> _tryGetMovieFromCache({required int movieId}) async {
    final serviceRequest = await _getCachedMovieByIdService.call(movieId: movieId);
    final result = serviceRequest.fold((l) => l, (r) => r);
    if (result is MovieEntity) {
      _movie = result;
      return true;
    } else {
      return false;
    }
  }

  Future<void> _getMovieFromApi({required int movieId}) async {
    final serviceRequest = await _getMovieByIdService.call(movieId: movieId);
    final result = serviceRequest.fold((l) => l, (r) => r);
    if (result is MovieEntity) {
      await _saveMovieToCache(movie: result);
      _movie = result;
      isMovieLoading.value = false;
      isMovieLoading.notifyListeners();
    } else {
      print("impossivel pegar da api");
    }
  }

  Future<bool> _saveMovieToCache({required MovieEntity movie}) async {
    final serviceRequest = await _saveMovieToCacheService(movie: movie);
    final result = serviceRequest.fold((l) => l, (r) => r);
    return result is CoreSuccess ? true : false;
  }
}
