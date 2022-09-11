import '../../../domain/entities/movie_snapshot_entity.dart';

import '../../../../core_module/error_handling/core_success.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/proxy/proxy_movie_entity.dart';
import '../../../domain/entities/proxy/proxy_movie_snapshot_entity.dart';
import '../../../error_handling/success.dart';
import '../cached_movie_gateway.dart';

class ProxyCachedMovieGateway implements ICachedMovieGateway {
  @override
  Future<MovieEntity> getCachedMovieById({required int movieId}) async {
    await Future.delayed(const Duration(seconds: 2));
    return ProxyMovieEntity.generateSingle();
  }

  @override
  Future<List<MovieSnapshotEntity>> getCachedMoviesSnapshot() async {
    await Future.delayed(const Duration(seconds: 2));
    return ProxyMovieSnapshotEntity.generateList();
  }

  @override
  Future<CoreSuccess> saveCachedMoviesSnapshot({required List<MovieSnapshotEntity> movies}) async {
    await Future.delayed(const Duration(seconds: 2));
    return SaveCachedMoviesSnapshotSuccess();
  }

  @override
  Future<CoreSuccess> saveMovieToCache({required MovieEntity movie}) async {
    await Future.delayed(const Duration(seconds: 2));
    return SaveMovieToCacheSuccess();
  }
}
