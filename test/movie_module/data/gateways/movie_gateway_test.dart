import 'package:desafio_tokenlab/core_module/api/base_http_client.dart';
import 'package:desafio_tokenlab/movie_module/data/gateways/movie_gateway.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/movie_entity.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/movie_snapshot_entity.dart';
import 'package:desafio_tokenlab/movie_module/error_handling/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBaseHttpClient extends Mock implements BaseHttpClient {}

void main() {
  late final IBaseHttpClient baseHttpClient;
  late final MovieGateway gateway;

  final Map<String, dynamic> tMovieEntityJson = {
    "adult": false,
    "backdrop_url": "https://image.tmdb.org/t/p/w500/poec6RqOKY9iSiIUmfyfPfiLtvBx.jpg",
    "belongs_to_collection": {
      "id": 230,
      "name": "The Godfather Collection",
      "poster_url": "https://image.tmdb.org/t/p/w200/9Baumh5J9N1nJUYzNkm0xsgjpwY.jpg",
      "backdrop_url": "https://image.tmdb.org/t/p/w500/3WZTxpgscsmoUk81TuECXdFOD0R.jpg"
    },
    "budget": 13000000,
    "genres": ["Drama", "Crime"],
    "homepage": null,
    "id": 240,
    "imdb_id": "tt0071562",
    "original_language": "en",
    "original_title": "The Godfather: Part II",
    "overview":
        "In the continuing saga of the Corleone crime family, a young Vito Corleone grows up in Sicily and in 1910s New York. In the 1950s, Michael Corleone attempts to expand the family business into Las Vegas, Hollywood and Cuba.",
    "popularity": 17.578,
    "poster_url": "https://image.tmdb.org/t/p/w200/v3KCBeX0CBlZnHZndimm7taYqwo.jpg",
    "production_companies": [
      {
        "id": 4,
        "logo_url": "https://image.tmdb.org/t/p/w200/fycMZt242LVjagMByZOLUGbCvv3.png",
        "name": "Paramount",
        "origin_country": "US"
      },
      {"id": 536, "logo_url": null, "name": "The Coppola Company", "origin_country": ""}
    ],
    "production_countries": [
      {"iso_3166_1": "US", "name": "United States of America"}
    ],
    "release_date": "1974-12-20",
    "revenue": 102600000,
    "runtime": 200,
    "spoken_languages": [
      {"iso_639_1": "en", "name": "English"},
      {"iso_639_1": "it", "name": "Italiano"},
      {"iso_639_1": "la", "name": "Latin"},
      {"iso_639_1": "es", "name": "Español"}
    ],
    "status": "Released",
    "tagline": "I don't feel I have to wipe everybody out, Tom. Just my enemies.",
    "title": "The Godfather: Part II",
    "video": false,
    "vote_average": 8.5,
    "vote_count": 4794
  };

  final List<Map<String, dynamic>> tMovieSnapshotListJson = [
    {
      "id": 19404,
      "vote_average": 9.3,
      "title": "Dilwale Dulhania Le Jayenge",
      "poster_url": "https://image.tmdb.org/t/p/w200/2CAL2433ZeIihfX1Hb2139CX0pW.jpg",
      "genres": ["Comedy", "Drama", "Romance"],
      "release_date": "1995-10-20"
    },
    {
      "id": 278,
      "vote_average": 8.6,
      "title": "The Shawshank Redemption",
      "poster_url": "https://image.tmdb.org/t/p/w200/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
      "genres": ["Drama", "Crime"],
      "release_date": "1994-09-23"
    },
    {
      "id": 238,
      "vote_average": 8.6,
      "title": "The Godfather",
      "poster_url": "https://image.tmdb.org/t/p/w200/rPdtLWNsZmAtoZl9PK7S2wE3qiS.jpg",
      "genres": ["Drama", "Crime"],
      "release_date": "1972-03-14"
    },
    {
      "id": 372058,
      "vote_average": 8.5,
      "title": "Your Name.",
      "poster_url": "https://image.tmdb.org/t/p/w200/q719jXXEzOoYaps6babgKnONONX.jpg",
      "genres": ["Romance", "Animation", "Drama"],
      "release_date": "2016-08-26"
    },
    {
      "id": 240,
      "vote_average": 8.5,
      "title": "The Godfather: Part II",
      "poster_url": "https://image.tmdb.org/t/p/w200/v3KCBeX0CBlZnHZndimm7taYqwo.jpg",
      "genres": ["Drama", "Crime"],
      "release_date": "1974-12-20"
    }
  ];

  setUpAll(() {
    baseHttpClient = MockBaseHttpClient();
    gateway = MovieGateway(baseHttpClient);
  });

  group('MovieGateway.getMovieById', () {
    test('Should return a valid Movie Entity on success', () async {
      when(() => baseHttpClient.getAsync("/240")).thenAnswer(
          (_) async => Response(data: tMovieEntityJson, statusCode: 200, requestOptions: RequestOptions(path: '')));
      final result = await gateway.getMovieById(movieId: 240);
      expect(result, isA<MovieEntity>());
      verify(() => baseHttpClient.getAsync("/240")).called(1);
      verifyNoMoreInteractions(baseHttpClient);
    });

    test('Should throw a GetMovieByIdException on unsuccess', () async {
      when(() => baseHttpClient.getAsync("/240")).thenAnswer(
          (_) async => Response(data: tMovieEntityJson, statusCode: 418, requestOptions: RequestOptions(path: '')));
      await expectLater(gateway.getMovieById(movieId: 240), throwsA(isA<GetMovieByIdException>()));
      verify(() => baseHttpClient.getAsync("/240")).called(1);
      verifyNoMoreInteractions(baseHttpClient);
    });
  });

  group('MovieGateway.getMoviesSnapshot', () {
    test('Should return a valid List<MovieSnapshotEntity> on success', () async {
      when(() => baseHttpClient.getAsync("")).thenAnswer((_) async =>
          Response(data: tMovieSnapshotListJson, statusCode: 200, requestOptions: RequestOptions(path: '')));
      final result = await gateway.getMoviesSnapshot();
      expect(result, isA<List<MovieSnapshotEntity>>());
      verify(() => baseHttpClient.getAsync("")).called(1);
      verifyNoMoreInteractions(baseHttpClient);
    });

    test('Should throw a GetMoviesSnapshotException on unsuccess', () async {
      when(() => baseHttpClient.getAsync("")).thenAnswer((_) async =>
          Response(data: tMovieSnapshotListJson, statusCode: 418, requestOptions: RequestOptions(path: '')));
      await expectLater(gateway.getMoviesSnapshot(), throwsA(isA<GetMoviesSnapshotException>()));
      verify(() => baseHttpClient.getAsync("")).called(1);
      verifyNoMoreInteractions(baseHttpClient);
    });
  });
}
