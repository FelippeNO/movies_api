import 'package:desafio_tokenlab/movie_module/domain/entities/movie_entity.dart';
import '../../../../core_module/utils/proxier.dart';

class ProxyMovieEntity {
  static MovieEntity generateSingle() => MovieEntity(
      id: proxyInt,
      voteAverage: proxyDouble,
      title: proxyWords(2),
      posterUrl: proxyImgUrl,
      genres: proxyWords(3).split(' '),
      releaseDate: proxyDate.toString(),
      budget: proxyInt,
      overview: proxyWords(20),
      popularity: proxyDouble,
      voteCount: proxyInt);
}
