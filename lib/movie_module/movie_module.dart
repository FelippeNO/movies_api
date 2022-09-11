import 'package:desafio_tokenlab/core_module/api/base_http_client.dart';
import 'package:desafio_tokenlab/movie_module/presentation/controllers/home_view_controller.dart';
import 'package:desafio_tokenlab/movie_module/presentation/views/detailed_view.dart';
import 'package:desafio_tokenlab/movie_module/presentation/views/home_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core_module/internal_storage/base_caching.dart';
import 'data/gateways/cached_movie_gateway.dart';
import 'data/gateways/movie_gateway.dart';
import 'data/repositories/cached_movie_repository.dart';
import 'data/repositories/movie_repository.dart';
import 'domain/services/get_movie_by_id_service.dart';
import 'domain/services/get_movies_snapshot_service.dart';

class MovieModule extends Module {
  @override
  final List<Bind> binds = [
    /// ------------------------------- Providers ---------------------------------
    Bind.lazySingleton((i) => BaseHttpClient(), export: true),
    Bind.lazySingleton((i) => BaseCaching(), export: true),

    /// ------------------------------- Gateways ---------------------------------
    Bind.lazySingleton((i) => MovieGateway(i()), export: true),
    Bind.lazySingleton((i) => CachedMovieGateway(i()), export: true),

    /// ------------------------------- Repositories ---------------------------------
    Bind.lazySingleton((i) => MovieRepository(i()), export: true),
    Bind.lazySingleton((i) => CachedMovieRepository(i()), export: true),

    /// ------------------------------- Services ---------------------------------
    Bind.lazySingleton((i) => GetMovieByIdService(i()), export: true),
    Bind.lazySingleton((i) => GetMoviesSnapshotService(i()), export: true),

    /// ------------------------------- State ---------------------------------
    Bind.lazySingleton((i) => HomeViewController(i()), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomeView()),
    ChildRoute('/detailed', child: (_, args) => DetailedView(movieId: args.data)),
  ];
}
