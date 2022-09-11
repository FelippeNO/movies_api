
// import 'package:desafio_tokenlab/core_module/internal_storage/base_caching.dart';
// import 'package:desafio_tokenlab/movie_module/data/gateways/cached_movie_gateway.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:mocktail/mocktail.dart';

// class MockBaseCaching extends Mock implements BaseCaching {}

// class MockHiveInterface extends Mock implements HiveInterface {}

// class MockHiveBox extends Mock implements Box {}

// void main() {
//   late final IBaseCaching baseCaching;
//   late final CachedMovieGateway gateway;
//   MockHiveInterface mockHiveInterface;
//   MockHiveBox mockHiveBox;

//   final Map<String, dynamic> tMovieEntityJson = {
//     "adult": false,
//     "backdrop_url": "https://image.tmdb.org/t/p/w500/poec6RqOKY9iSiIUmfyfPfiLtvBx.jpg",
//     "belongs_to_collection": {
//       "id": 230,
//       "name": "The Godfather Collection",
//       "poster_url": "https://image.tmdb.org/t/p/w200/9Baumh5J9N1nJUYzNkm0xsgjpwY.jpg",
//       "backdrop_url": "https://image.tmdb.org/t/p/w500/3WZTxpgscsmoUk81TuECXdFOD0R.jpg"
//     },
//     "budget": 13000000,
//     "genres": ["Drama", "Crime"],
//     "homepage": null,
//     "id": 240,
//     "imdb_id": "tt0071562",
//     "original_language": "en",
//     "original_title": "The Godfather: Part II",
//     "overview":
//         "In the continuing saga of the Corleone crime family, a young Vito Corleone grows up in Sicily and in 1910s New York. In the 1950s, Michael Corleone attempts to expand the family business into Las Vegas, Hollywood and Cuba.",
//     "popularity": 17.578,
//     "poster_url": "https://image.tmdb.org/t/p/w200/v3KCBeX0CBlZnHZndimm7taYqwo.jpg",
//     "production_companies": [
//       {
//         "id": 4,
//         "logo_url": "https://image.tmdb.org/t/p/w200/fycMZt242LVjagMByZOLUGbCvv3.png",
//         "name": "Paramount",
//         "origin_country": "US"
//       },
//       {"id": 536, "logo_url": null, "name": "The Coppola Company", "origin_country": ""}
//     ],
//     "production_countries": [
//       {"iso_3166_1": "US", "name": "United States of America"}
//     ],
//     "release_date": "1974-12-20",
//     "revenue": 102600000,
//     "runtime": 200,
//     "spoken_languages": [
//       {"iso_639_1": "en", "name": "English"},
//       {"iso_639_1": "it", "name": "Italiano"},
//       {"iso_639_1": "la", "name": "Latin"},
//       {"iso_639_1": "es", "name": "Español"}
//     ],
//     "status": "Released",
//     "tagline": "I don't feel I have to wipe everybody out, Tom. Just my enemies.",
//     "title": "The Godfather: Part II",
//     "video": false,
//     "vote_average": 8.5,
//     "vote_count": 4794
//   };

//   final List<Map<String, dynamic>> tMovieSnapshotListJson = [
//     {
//       "id": 19404,
//       "vote_average": 9.3,
//       "title": "Dilwale Dulhania Le Jayenge",
//       "poster_url": "https://image.tmdb.org/t/p/w200/2CAL2433ZeIihfX1Hb2139CX0pW.jpg",
//       "genres": ["Comedy", "Drama", "Romance"],
//       "release_date": "1995-10-20"
//     },
//     {
//       "id": 278,
//       "vote_average": 8.6,
//       "title": "The Shawshank Redemption",
//       "poster_url": "https://image.tmdb.org/t/p/w200/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
//       "genres": ["Drama", "Crime"],
//       "release_date": "1994-09-23"
//     },
//     {
//       "id": 238,
//       "vote_average": 8.6,
//       "title": "The Godfather",
//       "poster_url": "https://image.tmdb.org/t/p/w200/rPdtLWNsZmAtoZl9PK7S2wE3qiS.jpg",
//       "genres": ["Drama", "Crime"],
//       "release_date": "1972-03-14"
//     },
//     {
//       "id": 372058,
//       "vote_average": 8.5,
//       "title": "Your Name.",
//       "poster_url": "https://image.tmdb.org/t/p/w200/q719jXXEzOoYaps6babgKnONONX.jpg",
//       "genres": ["Romance", "Animation", "Drama"],
//       "release_date": "2016-08-26"
//     },
//     {
//       "id": 240,
//       "vote_average": 8.5,
//       "title": "The Godfather: Part II",
//       "poster_url": "https://image.tmdb.org/t/p/w200/v3KCBeX0CBlZnHZndimm7taYqwo.jpg",
//       "genres": ["Drama", "Crime"],
//       "release_date": "1974-12-20"
//     }
//   ];

//  final String tMovieJsonString = tMovieEntityJson.toString();

//   setUpAll(() {
//     mockHiveBox = MockHiveBox();
//     baseCaching = MockBaseCaching();
//     gateway = CachedMovieGateway(baseCaching);

//     mockHiveInterface = MockHiveInterface();


//   });

//   group('MovieGateway.getCachedMovieById', () {
//     Future openHive() async {
//       await Hive.initFlutter();
//       var box = await Hive.openBox('testBox');
//       var box2 = await Hive.box('testBox');
//       await box2.put("a", "xxxxcvdc");
//       var fasdf = await box2.get("a");
//       print(fasdf);
//     }

//     openHive();

//     test('Should return a valid Movie Entity on success', () async {
//       mockHiveBox = MockHiveBox();
//       mockHiveInterface = MockHiveInterface();
//       when(() => mockHiveInterface.box('moviesBox')).thenAnswer((_) => mockHiveBox);
//       when(() => mockHiveBox.get("/240")).thenAnswer((_) => tMovieJsonString);
//       when(() => baseCaching.getFromCache("240")).thenAnswer((_) => tMovieJsonString);

//       final result = gateway.getCachedMovieById(movieId: 240);
//       expect(result, isA<MovieEntity>());
//       verify(() => baseCaching.getFromCache("/240")).called(1);
//       verifyNoMoreInteractions(baseCaching);
//     });

//     test('Should throw a GetCachedMovieByIdException on unsuccess', () async {
//       when(() => baseCaching.getFromCache("/240")).thenAnswer((_) => "");
//       await expectLater(gateway.getCachedMovieById(movieId: 240), throwsA(isA<GetCachedMovieByIdException>()));
//       verify(() => baseCaching.getFromCache("/240")).called(1);
//       verifyNoMoreInteractions(baseCaching);
//     });
//   });
// }
