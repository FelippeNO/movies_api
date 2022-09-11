import '../../../domain/entities/movie_snapshot_entity.dart';

import '../../../domain/entities/movie_entity.dart';

import '../../../domain/entities/proxy/proxy_movie_entity.dart';
import '../../../domain/entities/proxy/proxy_movie_snapshot_entity.dart';
import '../movie_gateway.dart';

class ProxyMovieGateway implements IMovieGateway {
  @override
  Future<MovieEntity> getMovieById({required int movieId}) async {
    await Future.delayed(const Duration(seconds: 2));
    return ProxyMovieEntity.generateSingle();
  }

  @override
  Future<List<MovieSnapshotEntity>> getMoviesSnapshot() async {
    await Future.delayed(const Duration(seconds: 2));
    return ProxyMovieSnapshotEntity.generateList();
  }
}
