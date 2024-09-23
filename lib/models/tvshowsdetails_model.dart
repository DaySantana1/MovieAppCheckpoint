class TvShowDetails {
  bool adult;
  String backdropPath;
  List<dynamic> createdBy;
  List<int> episodeRunTime;
  DateTime? firstAirDate;
  List<Genres> genres;
  String homepage;
  int id;
  bool inProduction;
  List<String> languages;
  String lastAirDate;
  LastEpisodeToAir lastEpisodeToAir;
  String name;
  dynamic nextEpisodeToAir;
  List<Networks> networks;
  int numberOfEpisodes;
  int numberOfSeasons;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  List<dynamic> productionCompanies;
  String status;
  String tagline;
  String type;
  double voteAverage;
  int voteCount;

  TvShowDetails({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvShowDetails.fromJson(Map<String, dynamic> json) => TvShowDetails(
        adult: json['adult'] ?? false,
        backdropPath: json['backdrop_path'] ?? '',
        createdBy: json['created_by'] ?? [],
        episodeRunTime: (json['episode_run_time'] as List<dynamic>?)
                ?.map((e) => e as int)
                .toList() ??
            [],
        firstAirDate: DateTime.tryParse(json['first_air_date'] ?? ''),
        genres: (json['genres'] as List<dynamic>?)
                ?.map((e) => Genres.fromJson(e))
                .toList() ??
            [],
        homepage: json['homepage'] ?? '',
        id: json['id'] ?? 0,
        inProduction: json['in_production'] ?? false,
        languages: (json['languages'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
        lastAirDate: json['last_air_date'] ?? '',
        lastEpisodeToAir: json['last_episode_to_air'] != null
            ? LastEpisodeToAir.fromJson(json['last_episode_to_air'])
            : LastEpisodeToAir(
                id: 0,
                name: '',
                overview: '',
                voteAverage: 0,
                voteCount: 0,
                airDate: DateTime.now(),
                episodeNumber: 0,
                episodeType: '',
                productionCode: '',
                runtime: 0,
                seasonNumber: 0,
                showId: 0,
                stillPath: null,
              ),
        name: json['name'] ?? '',
        nextEpisodeToAir: json['next_episode_to_air'] ?? null,
        networks: (json['networks'] as List<dynamic>?)
                ?.map((e) => Networks.fromJson(e))
                .toList() ??
            [],
        numberOfEpisodes: json['number_of_episodes'] ?? 0,
        numberOfSeasons: json['number_of_seasons'] ?? 0,
        originCountry: (json['origin_country'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
        originalLanguage: json['original_language'] ?? 'unknown',
        originalName: json['original_name'] ?? '',
        overview: json['overview'] ?? '',
        popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
        posterPath: json['poster_path'] ?? '',
        productionCompanies: json['production_companies'] ?? [],
        status: json['status'] ?? '',
        tagline: json['tagline'] ?? '',
        type: json['type'] ?? '',
        voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
        voteCount: json['vote_count'] ?? 0,
      );
}

class Genres {
  int id;
  String name;

  Genres({required this.id, required this.name});

  factory Genres.fromJson(Map<String, dynamic> json) => Genres(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class LastEpisodeToAir {
  int id;
  String name;
  String overview;
  int voteAverage;
  int voteCount;
  DateTime? airDate;
  int episodeNumber;
  String episodeType;
  String productionCode;
  int runtime;
  int seasonNumber;
  int showId;
  dynamic stillPath;

  LastEpisodeToAir({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.airDate,
    required this.episodeNumber,
    required this.episodeType,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
  });

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      LastEpisodeToAir(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        overview: json['overview'] ?? '',
        voteAverage: json['vote_average'] ?? 0,
        voteCount: json['vote_count'] ?? 0,
        airDate: DateTime.tryParse(json['air_date'] ?? ''),
        episodeNumber: json['episode_number'] ?? 0,
        episodeType: json['episode_type'] ?? '',
        productionCode: json['production_code'] ?? '',
        runtime: json['runtime'] ?? 0,
        seasonNumber: json['season_number'] ?? 0,
        showId: json['show_id'] ?? 0,
        stillPath: json['still_path'],
      );
}

class Networks {
  final int id;
  String logoPath;
  String name;
  String originCountry;

  Networks({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory Networks.fromJson(Map<String, dynamic> json) => Networks(
        id: json['id'] ?? 0,
        logoPath: json['logo_path'] ?? '',
        name: json['name'] ?? '',
        originCountry: json['origin_country'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'logo_path': logoPath,
        'name': name,
        'origin_country': originCountry,
      };
}
