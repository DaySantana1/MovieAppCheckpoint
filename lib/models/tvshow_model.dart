import 'dart:convert';

class TvShowResult {
  int page;
  List<TvShow> tvshows;
  int totalPages;
  int totalResults;

  TvShowResult({
    required this.page,
    required this.tvshows,
    required this.totalPages,
    required this.totalResults,
  });

  factory TvShowResult.fromRawJson(String str) =>
      TvShowResult.fromJson(json.decode(str));

  factory TvShowResult.fromJson(Map<String, dynamic> json) => TvShowResult(
        page: json["page"],
        tvshows:
            List<TvShow>.from(json["results"].map((x) => TvShow.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class TvShow {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  DateTime? firstAirDate;
  String name;
  double voteAverage;
  int voteCount;

  TvShow({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvShow.fromJson(Map<String, dynamic> json) {
    return TvShow(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'] ?? '',
      genreIds: (json['genre_ids'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      id: json['id'] ?? 0,
      originCountry: (json['origin_country'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      originalLanguage: json['original_language'] ?? 'unknown',
      originalName: json['original_name'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      posterPath: json['poster_path'] ?? '',
      firstAirDate: DateTime.tryParse(json['first_air_date'] ?? ''),
      name: json['name'] ?? '',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }
}
