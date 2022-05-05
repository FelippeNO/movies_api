import '../../data/gateways/core_gateway.dart';
import '../../domain/entities/movie_data_entity.dart';
import '../../domain/entities/movies_entity.dart';
import '../views/detailed_view.dart';
import 'package:flutter/material.dart';

class CoreController {
  late ValueNotifier<MovieDataEntity> movieD = ValueNotifier(MovieDataEntity(id: 0));
  static late ValueNotifier<List<MovieEntity>> movies = ValueNotifier([]);
  ValueNotifier<bool> movieLoading = ValueNotifier(true);
  ValueNotifier<bool> moviesLoading = ValueNotifier(true);

  Future<void> initialize() async {
    movies.value = await CoreGateway.getMoviesList();
    moviesLoading.value = false;
  }

  Future<void> getMovieByIdService(int movieId) async {
    movieD.value = await CoreGateway.getMovieById(movieId);
    movieLoading.value = false;
  }

  void handleMovieTap(BuildContext context, int movieId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailedView(
          movieId: movieId,
        ),
      ),
    );
  }
}
