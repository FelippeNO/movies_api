import '../widgets/connection_snack_bar.dart';
import '../../movie_module/data/gateways/movie_gateway.dart';
import '../../movie_module/domain/entities/movie_snapshot_entity.dart';
import '../views/detailed_view.dart';
import 'package:flutter/material.dart';

class CoreController {
  late ValueNotifier<MovieEntity> movie = ValueNotifier(MovieEntity(id: 0));
  static late ValueNotifier<List<MovieEntity>> movies = ValueNotifier([]);
  ValueNotifier<bool> movieLoading = ValueNotifier(true);
  ValueNotifier<bool> moviesLoading = ValueNotifier(true);

  Future<void> initialize(BuildContext context) async {
    bool connectionState = await CoreGateway.connectionState();
    if (connectionState == false) {
      ScaffoldMessenger.of(context).showSnackBar(const ConnectionSnackBar());
    }
    await CoreGateway.saveMoviesListToSharedPrefs();
    movies.value = await CoreGateway.getMoviesListFromSharedPrefs();
    moviesLoading.value = false;
  }

  Future<void> getMovieByIdService(int movieId, BuildContext context) async {
    bool connectionState = await CoreGateway.connectionState();
    if (connectionState == false) {
      ScaffoldMessenger.of(context).showSnackBar(const ConnectionSnackBar());
    }

    await CoreGateway.saveMovieByIdToSharedPrefs(movieId);
    movie.value = await CoreGateway.getMovieFromSharedPrefs(movieId);
    movieLoading.value = false;
  }

  void handleMovieTap(BuildContext context, int movieId, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailedView(
          movieId: movieId,
          index: index,
        ),
      ),
    );
  }
}
