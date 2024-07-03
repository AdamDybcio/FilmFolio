import 'package:dio/dio.dart';
import 'package:movie_bloc_app/features/movies/data/models/genre_model.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';

import '../../../../../core/utils/strings/api_strings.dart';
import '../../models/movies_result_model.dart';
import 'tmdb_datasource.dart';

class TmdbDatasourceImpl implements TmdbDatasource {
  final Dio dio;

  TmdbDatasourceImpl(this.dio);

  @override
  Future<MoviesResultModel> getTrending({int page = 1}) async {
    final response = await dio.get(
      '${ApiStrings.baseUrl}trending/movie/day',
      queryParameters: {
        'api_key': ApiStrings.apiKey,
        'page': page,
      },
    );

    return MoviesResultModel.fromJson(response.data);
  }

  @override
  Future<List<GenreModel>> getGenres() async {
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
  Future<MoviesResultModel> getDiscoverMovies({required GenreModel genre, required int year, int page = 1}) async {
    final response = await dio.get(
      '${ApiStrings.baseUrl}discover/movie',
      queryParameters: {
        'api_key': ApiStrings.apiKey,
        'with_genres': genre.id,
        'primary_release_year': year,
        'page': page,
        'include_adult': 'true',
        'include_video': 'true',
      },
    );

    return MoviesResultModel.fromJson(response.data);
  }

  @override
  Future<MoviesResultModel> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '${ApiStrings.baseUrl}movie/now_playing',
      queryParameters: {
        'api_key': ApiStrings.apiKey,
        'page': page,
      },
    );

    return MoviesResultModel.fromJson(response.data);
  }

  @override
  Future<MoviesResultModel> getTopRated({int page = 1}) async {
    final response = await dio.get(
      '${ApiStrings.baseUrl}movie/top_rated',
      queryParameters: {
        'api_key': ApiStrings.apiKey,
        'page': page,
      },
    );

    return MoviesResultModel.fromJson(response.data);
  }

  @override
  Future<MoviesResultModel> getUpcoming({int page = 1}) async {
    final response = await dio.get(
      '${ApiStrings.baseUrl}movie/upcoming',
      queryParameters: {
        'api_key': ApiStrings.apiKey,
        'page': page,
      },
    );

    return MoviesResultModel.fromJson(response.data);
  }

  @override
  Future<MovieDetailsModel> getMovieDetails({required int id}) async {
    final response = await dio.get(
      '${ApiStrings.baseUrl}movie/$id',
      queryParameters: {
        'api_key': ApiStrings.apiKey,
      },
    );

    return MovieDetailsModel.fromJson(response.data);
  }
}
