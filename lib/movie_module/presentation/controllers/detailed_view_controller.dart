import 'package:flutter/material.dart';

import '../../domain/entities/movie_entity.dart';
import '../../domain/entities/movie_snapshot_entity.dart';
import '../../domain/services/get_movie_by_id_service.dart';
import '../../domain/services/get_movies_snapshot_service.dart';
import '../../domain/services/save_movie_to_cache_service.dart';

class DetailedViewController extends ChangeNotifier {
  late MovieEntity _movie;
  final GetMovieByIdService _getMovieByIdService;
  final SaveMovieToCacheService _saveMovieToCacheService;

  ValueNotifier<bool> isMovieLoading = ValueNotifier<bool>(true);

  MovieEntity get movie => _movie;

  DetailedViewController(
    this._getMovieByIdService,
    this._saveMovieToCacheService,
  );

  init({required int movieId}) async {
    isMovieLoading.value = true;
    final serviceRequest = await _getMovieByIdService.call(movieId: movieId);
    final result = serviceRequest.fold((l) => l, (r) => r);

    if (result is MovieEntity) {
      _movie = result;
      isMovieLoading.value = false;
      isMovieLoading.notifyListeners();
    }
  }
}
