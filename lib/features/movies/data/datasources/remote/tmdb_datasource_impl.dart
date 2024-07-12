import 'package:dio/dio.dart';
import 'package:movie_bloc_app/core/utils/strings/temp_user_settings.dart';
import 'package:movie_bloc_app/features/movies/data/models/genre_model.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';

import '../../../../../core/utils/strings/api_strings.dart';
import '../../models/movies_result_model.dart';
import 'tmdb_datasource.dart';

class TmdbDatasourceImpl implements TmdbDatasource {
  final Dio dio;

  TmdbDatasourceImpl(this.dio);

  @override
  Future<MoviesResultModel> getPopularMovies({int page = 1}) async {
    Map<String, dynamic> settings = TempUserSettings().settings;

    settings['page'] = page;
    settings['sort_by'] = 'popularity.desc';

    final response = await dio.get(
      '${ApiStrings.baseUrl}discover/movie',
      queryParameters: settings,
    );

    return MoviesResultModel.fromJson(response.data);
  }

  @override
  Future<MoviesResultModel> getUpcomingMovies({int page = 1}) async {
    Map<String, dynamic> settings = TempUserSettings().settings;

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

  @override
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

  @override
  Future<MovieDetailsModel> getMovieDetails({required int id}) async {
    final response = await dio.get(
      '${ApiStrings.baseUrl}movie/$id',
      queryParameters: {
        'api_key': ApiStrings.apiKey,
        'append_to_response': 'credits,videos,reviews',
      },
    );

    return MovieDetailsModel.fromJson(response.data);
  }

  @override
  Future<MoviesResultModel> searchMovies({required String query}) async {
    final response = await dio.get(
      '${ApiStrings.baseUrl}search/movie',
      queryParameters: {
        'api_key': ApiStrings.apiKey,
        'query': query,
        'include_adult': 'true',
      },
    );

    return MoviesResultModel.fromJson(response.data);
  }
}
