import 'package:flutter/material.dart';

import '../../domain/services/get_movie_by_id_service.dart';
import '../../domain/services/get_movies_snapshot_service.dart';

class DetailedViewController extends ChangeNotifier {
  final GetMovieByIdService _getMovieByIdService;

  DetailedViewController(
    this._getMovieByIdService,
  );
}
