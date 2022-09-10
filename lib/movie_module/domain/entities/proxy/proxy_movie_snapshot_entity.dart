import '../../../../core_module/utils/proxier.dart';
import '../movie_snapshot_entity.dart';

class ProxyMovieSnapshotEntity {
  static MovieSnapshotEntity generateSingle() => MovieSnapshotEntity(
        id: proxyInt,
        voteAverage: proxyDouble,
        title: proxyWords(2),
        posterUrl: proxyImgUrl,
        genres: proxyWords(3).split(' '),
        releaseDate: proxyDate.toString(),
      );

  static List<MovieSnapshotEntity> generateList({int lenght = 12}) => List.generate(
        lenght,
        (index) => generateSingle(),
      );
}
