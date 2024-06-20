import 'package:dio/dio.dart';
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
}
