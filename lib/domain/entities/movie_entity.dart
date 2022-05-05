class MovieEntity {
  int? id;
  double? voteAverage;
  String? title;
  String? posterUrl;
  List<String>? genres;
  String? releaseDate;
  int? budget;
  String? overview;
  double? popularity;
  int? voteCount;

  MovieEntity({
    this.id,
    this.voteAverage,
    this.title,
    this.posterUrl,
    this.genres,
    this.releaseDate,
    this.budget,
    this.overview,
    this.popularity,
    this.voteCount,
  });

  MovieEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voteAverage = json['vote_average'];
    title = json['title'];
    posterUrl = json['poster_url'];
    genres = json['genres'].cast<String>();
    releaseDate = json['release_date'];
    budget = json['budget'];
    overview = json['overview'];
    popularity = json['popularity'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vote_average'] = voteAverage;
    data['title'] = title;
    data['poster_url'] = posterUrl;
    data['genres'] = genres;
    data['release_date'] = releaseDate;
    data['budget'] = budget;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['vote_count'] = voteCount;
    return data;
  }
}
