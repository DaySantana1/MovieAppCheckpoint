import 'dart:convert';

import 'package:movie_app/common/utils.dart';
import 'package:movie_app/models/movie_details_model.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/tvshow_model.dart';
import 'package:movie_app/models/tvshowsdetails_model.dart';

const baseUrl = 'https://api.themoviedb.org/3/';
const key = '?api_key=$apiKey';

class ApiServices {
  Future<Result> getTopRatedMovies() async {
    var endPoint = 'movie/top_rated';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Result.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load now playing movies');
  }

  Future<Result> getNowPlayingMovies() async {
    var endPoint = 'movie/now_playing';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Result.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load now playing movies');
  }

  Future<Result> getUpcomingMovies() async {
    var endPoint = 'movie/upcoming';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Result.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load upcoming movies');
  }

  Future<Result> getPopularMovies() async {
    const endPoint = 'movie/popular';
    const url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url), headers: {});
    if (response.statusCode == 200) {
      return Result.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load now playing movies');
  }

  Future<Result> getDetailsMovies(int movie_id) async {
    final endPoint = 'movie/$movie_id';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url), headers: {});
    if (response.statusCode == 200) {
      return Result.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load now playing movies');
  }

  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final endPoint = "movie/$movieId";
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url), headers: {});
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load movie details');
  }

  Future<Result> getMovieRecommendations(int movieId) async {
    final endPoint = 'movie/$movieId/recommendations';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Result.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie recommendations');
  }

  Future<TvShowResult> getPopularTvShows() async {
    const endPoint = 'tv/popular';
    const url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url), headers: {});
    if (response.statusCode == 200) {
      return TvShowResult.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load popular Tv Shows');
  }

  Future<TvShowDetails> getTvShowDetails(int tvShowId) async {
    final endPoint = "tv/$tvShowId";
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url), headers: {});
    if (response.statusCode == 200) {
      return TvShowDetails.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load Tv Show details');
  }
}
