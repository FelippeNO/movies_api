import 'dart:core';

import 'package:desafio_tokenlab/movie_module/domain/entities/mappers/movie_snapshot_entity_mapper.dart';
import 'package:desafio_tokenlab/movie_module/domain/entities/movie_snapshot_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
    },
    {
      "id": 424,
      "vote_average": 8.5,
      "title": "Schindler's List",
      "poster_url": "https://image.tmdb.org/t/p/w200/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg",
      "genres": ["Drama", "History", "War"],
      "release_date": "1993-12-15"
    },
    {
      "id": 129,
      "vote_average": 8.5,
      "title": "Spirited Away",
      "poster_url": "https://image.tmdb.org/t/p/w200/dL11DBPcRhWWnJcFXl9A07MrqTI.jpg",
      "genres": ["Animation", "Family", "Fantasy"],
      "release_date": "2001-07-20"
    },
    {
      "id": 497,
      "vote_average": 8.4,
      "title": "The Green Mile",
      "poster_url": "https://image.tmdb.org/t/p/w200/velWPhVMQeQKcxggNEU8YmIo52Rx.jpg",
      "genres": ["Fantasy", "Drama", "Crime"],
      "release_date": "1999-12-10"
    },
    {
      "id": 637,
      "vote_average": 8.4,
      "title": "Life Is Beautiful",
      "poster_url": "https://image.tmdb.org/t/p/w200/mfnkSeeVOBVheuyn2lo4tfmOPQb.jpg",
      "genres": ["Comedy", "Drama"],
      "release_date": "1997-12-20"
    },
    {
      "id": 680,
      "vote_average": 8.4,
      "title": "Pulp Fiction",
      "poster_url": "https://image.tmdb.org/t/p/w200/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg",
      "genres": ["Thriller", "Crime"],
      "release_date": "1994-09-10"
    },
    {
      "id": 550,
      "vote_average": 8.4,
      "title": "Fight Club",
      "poster_url": "https://image.tmdb.org/t/p/w200/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
      "genres": ["Drama"],
      "release_date": "1999-10-15"
    },
    {
      "id": 155,
      "vote_average": 8.4,
      "title": "The Dark Knight",
      "poster_url": "https://image.tmdb.org/t/p/w200/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
      "genres": ["Drama", "Thriller", "Crime", "Thriller"],
      "release_date": "2008-07-16"
    },
    {
      "id": 539,
      "vote_average": 8.4,
      "title": "Psycho",
      "poster_url": "https://image.tmdb.org/t/p/w200/5j5tdV8tMTy7FBdSNiYxp9Fj1Or.jpg",
      "genres": ["Drama", "Horror", "Thriller"],
      "release_date": "1960-06-16"
    },
    {
      "id": 311,
      "vote_average": 8.4,
      "title": "Once Upon a Time in America",
      "poster_url": "https://image.tmdb.org/t/p/w200/i0enkzsL5dPeneWnjl1fCWm6L7k.jpg",
      "genres": ["Drama", "Crime"],
      "release_date": "1984-05-23"
    },
    {
      "id": 389,
      "vote_average": 8.4,
      "title": "12 Angry Men",
      "poster_url": "https://image.tmdb.org/t/p/w200/ppd84D2i9W8jXmsyInGyihiSyqz.jpg",
      "genres": ["Drama"],
      "release_date": "1957-03-25"
    },
    {
      "id": 244786,
      "vote_average": 8.4,
      "title": "Whiplash",
      "poster_url": "https://image.tmdb.org/t/p/w200/oPxnRhyAIzJKGUEdSiwTJQBa3NM.jpg",
      "genres": ["Drama"],
      "release_date": "2014-10-10"
    },
    {
      "id": 13,
      "vote_average": 8.4,
      "title": "Forrest Gump",
      "poster_url": "https://image.tmdb.org/t/p/w200/saHP97rTPS5eLmrLQEcANmKrsFl.jpg",
      "genres": ["Comedy", "Drama", "Romance"],
      "release_date": "1994-07-06"
    },
    {
      "id": 510,
      "vote_average": 8.4,
      "title": "One Flew Over the Cuckoo's Nest",
      "poster_url": "https://image.tmdb.org/t/p/w200/3jcbDmRFiQ83drXNOvRDeKHxS0C.jpg",
      "genres": ["Drama"],
      "release_date": "1975-11-18"
    },
    {
      "id": 12477,
      "vote_average": 8.4,
      "title": "Grave of the Fireflies",
      "poster_url": "https://image.tmdb.org/t/p/w200/qG3RYlIVpTYclR9TYIsy8p7m7AT.jpg",
      "genres": ["Animation", "Drama", "War"],
      "release_date": "1988-04-16"
    },
    {
      "id": 11216,
      "vote_average": 8.4,
      "title": "Cinema Paradiso",
      "poster_url": "https://image.tmdb.org/t/p/w200/8SRUfRUi6x4O68n0VCbDNRa6iGL.jpg",
      "genres": ["Drama", "Romance"],
      "release_date": "1988-11-17"
    }
  ];

  test('Should return a List<MovieSnapshotEntity>', () async {
    var list = tMovieSnapshotListJson.map((e) {
      return MovieSnapshotEntityMapper.fromJson(e);
    }).toList();
    expect(20, list.length);
    expect(list.first.id, 19404);
    expect(list.last.releaseDate, "1988-11-17");
    expect(list, isA<List<MovieSnapshotEntity>>());
  });
}
