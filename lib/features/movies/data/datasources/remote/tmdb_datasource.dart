import 'package:dio/dio.dart';
import 'package:movie_bloc_app/core/dependency_injection/di.dart';
import 'package:movie_bloc_app/core/settings/user_settings.dart';
import 'package:movie_bloc_app/features/movies/data/models/genre_model.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';

import '../../../../../core/utils/strings/api_strings.dart';
import '../../models/movies_result_model.dart';

class TmdbDatasource {
  final Dio dio;

  TmdbDatasource(this.dio);

  Future<MoviesResultModel> getPopularMovies({int page = 1}) async {
    Map<String, dynamic> settings = sl<UserSettings>().getSettings();

    settings['page'] = page;
    settings['sort_by'] = 'popularity.desc';

    final response = await dio.get(
      '${ApiStrings.baseUrl}discover/movie',
      queryParameters: settings,
    );

    return MoviesResultModel.fromJson(response.data);
  }

  Future<MoviesResultModel> getUpcomingMovies({int page = 1}) async {
    Map<String, dynamic> settings = sl<UserSettings>().getSettings();

    settings['page'] = page;
    settings['sort_by'] = 'popularity.desc';
    settings['with_release_type'] = '2|3';
    settings['release_date.gte'] = DateTime.now().toString();
    settings['release_date.lte'] = DateTime.now().add(const Duration(days: 30)).toString();

    final response = await dio.get(
      '${ApiStrings.baseUrl}discover/movie',
      queryParameters: settings,
    );

    return MoviesResultModel.fromJson(response.data);
  }

  Future<MoviesResultModel> getTopRatedMovies({int page = 1}) async {
    Map<String, dynamic> settings = sl<UserSettings>().getSettings();

    settings['page'] = page;
    settings['sort_by'] = 'vote_average.desc';
    settings['without_genres'] = '99,10755';
    settings['vote_count.gte'] = 200;

    final response = await dio.get(
      '${ApiStrings.baseUrl}discover/movie',
      queryParameters: settings,
    );

    return MoviesResultModel.fromJson(response.data);
  }

  Future<MoviesResultModel> getNowPlayingMovies({int page = 1}) async {
    Map<String, dynamic> settings = sl<UserSettings>().getSettings();

    settings['page'] = page;
    settings['sort_by'] = 'popularity.desc';
    settings['with_release_type'] = '2|3';
    settings['release_date.gte'] = DateTime.now().subtract(const Duration(days: 30)).toString();
    settings['release_date.lte'] = DateTime.now().toString();

    final response = await dio.get(
      '${ApiStrings.baseUrl}discover/movie',
      queryParameters: settings,
    );

    return MoviesResultModel.fromJson(response.data);
  }

  Future<MoviesResultModel> getTrendingMovies() async {
    Map<String, dynamic> settings = sl<UserSettings>().getSettings();

    final response = await dio.get(
      '${ApiStrings.baseUrl}trending/movie/day',
      queryParameters: settings,
    );

    return MoviesResultModel.fromJson(response.data);
  }

  Future<List<GenreModel>> getMovieGenres() async {
    final response = await dio.get(
      '${ApiStrings.baseUrl}genre/movie/list',
      queryParameters: {
        'api_key': ApiStrings.apiKey,
      },
    );

    final genres = response.data['genres'].map<GenreModel>((genre) => GenreModel.fromJson(genre)).toList();

    return genres;
  }

  Future<MovieDetailsModel> getMovieDetails({required int id}) async {
    Map<String, dynamic> settings = sl<UserSettings>().getSettings();

    final response = await dio.get(
      '${ApiStrings.baseUrl}movie/$id',
      queryParameters: {
        'api_key': settings['api_key'],
        'append_to_response': 'credits,videos,reviews',
      },
    );

    return MovieDetailsModel.fromJson(response.data);
  }

  Future<MoviesResultModel> searchMovies({required String query}) async {
    Map<String, dynamic> settings = sl<UserSettings>().getSettings();

    settings['query'] = query;

    final response = await dio.get(
      '${ApiStrings.baseUrl}search/movie',
      queryParameters: settings,
    );

    return MoviesResultModel.fromJson(response.data);
  }

  Future<MoviesResultModel> getMoviesByGenre({required int genreId, int page = 1}) async {
    Map<String, dynamic> settings = sl<UserSettings>().getSettings();

    settings['with_genres'] = genreId;

    final response = await dio.get(
      '${ApiStrings.baseUrl}discover/movie',
      queryParameters: settings,
    );

    return MoviesResultModel.fromJson(response.data);
  }

  Future<MoviesResultModel> getSimilarMovies({required int movieId}) async {
    Map<String, dynamic> settings = sl<UserSettings>().getSettings();

    final response = await dio.get(
      '${ApiStrings.baseUrl}movie/$movieId/similar',
      queryParameters: {
        'api_key': settings['api_key'],
        'language': settings['language'],
      },
    );

    return MoviesResultModel.fromJson(response.data);
  }
}
