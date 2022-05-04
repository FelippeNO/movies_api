class MovieDataEntity {
  String? backdropUrl;
  int? budget;
  List<String>? genres;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterUrl;
  String? releaseDate;
  int? revenue;
  int? runtime;
  String? status;
  String? tagline;
  String? title;
  double? voteAverage;
  int? voteCount;

  MovieDataEntity(
      {this.backdropUrl,
      this.budget,
      this.genres,
      required this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterUrl,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.status,
      this.tagline,
      this.title,
      this.voteAverage,
      this.voteCount});

  MovieDataEntity.fromJson(Map<String, dynamic> json) {
    backdropUrl = json['backdrop_url'];
    budget = json['budget'];
    genres = json['genres'].cast<String>();
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterUrl = json['poster_url'];
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_url'] = backdropUrl;
    data['budget'] = budget;
    data['genres'] = genres;
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_url'] = posterUrl;
    data['release_date'] = releaseDate;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    data['status'] = status;
    data['tagline'] = tagline;
    data['title'] = title;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
