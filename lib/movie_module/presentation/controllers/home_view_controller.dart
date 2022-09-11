import 'package:flutter/material.dart';

import '../../domain/services/get_movies_snapshot_service.dart';

class HomeViewController extends ChangeNotifier {
  final GetMoviesSnapshotService _getMoviesSnapshotService;

  HomeViewController(
    this._getMoviesSnapshotService,
  );
}
