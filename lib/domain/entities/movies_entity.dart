class MovieEntity {
  int? id;
  double? voteAverage;
  String? title;
  String? posterUrl;
  List<String>? genres;
  String? releaseDate;

  MovieEntity({this.id, this.voteAverage, this.title, this.posterUrl, this.genres, this.releaseDate});

  MovieEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voteAverage = json['vote_average'];
    title = json['title'];
    posterUrl = json['poster_url'];
    genres = json['genres'].cast<String>();
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vote_average'] = voteAverage;
    data['title'] = title;
    data['poster_url'] = posterUrl;
    data['genres'] = genres;
    data['release_date'] = releaseDate;
    return data;
  }
}
