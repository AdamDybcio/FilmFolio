import 'package:dio/dio.dart';
import 'package:movie_bloc_app/features/movies/data/models/genre_model.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

import '../../../../../core/utils/strings/api_strings.dart';
import '../../models/movies_result_model.dart';
import 'tmdb_datasource.dart';

class TmdbDatasourceImpl implements TmdbDatasource {
  final Dio dio;

  TmdbDatasourceImpl(this.dio);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await dio.get(
      '${ApiStrings.baseUrl}trending/movie/day',
      queryParameters: {
        'api_key': ApiStrings.apiKey,
      },
    );

    final movies = MoviesResultModel.fromJson(response.data).movies ?? [];

    return movies;
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
  Future<List<MovieModel>> getDiscoverMovies({
    required GenreModel genre,
    required int year,
  }) async {
    final response = await dio.get(
      '${ApiStrings.baseUrl}discover/movie',
      queryParameters: {
        'api_key': ApiStrings.apiKey,
        'with_genres': genre.id,
        'primary_release_year': year,
      },
    );

    final movies = MoviesResultModel.fromJson(response.data).movies ?? [];

    return movies;
  }

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final response = await dio.get(
      '${ApiStrings.baseUrl}movie/now_playing',
      queryParameters: {
        'api_key': ApiStrings.apiKey,
      },
    );

    final movies = MoviesResultModel.fromJson(response.data).movies ?? [];

    return movies;
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final response = await dio.get(
      '${ApiStrings.baseUrl}movie/top_rated',
      queryParameters: {
        'api_key': ApiStrings.apiKey,
      },
    );

    final movies = MoviesResultModel.fromJson(response.data).movies ?? [];

    return movies;
  }

  @override
  Future<List<MovieModel>> getUpcoming() async {
    final response = await dio.get(
      '${ApiStrings.baseUrl}movie/upcoming',
      queryParameters: {
        'api_key': ApiStrings.apiKey,
      },
    );

    final movies = MoviesResultModel.fromJson(response.data).movies ?? [];

    return movies;
  }
}
