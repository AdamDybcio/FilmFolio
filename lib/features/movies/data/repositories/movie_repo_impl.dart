import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

import '../../domain/repositories/movie_repo.dart';
import '../datasources/remote/tmdb_datasource.dart';

class MovieRepoImpl extends MovieRepo {
  final TmdbDatasource tmdbDatasource;

  MovieRepoImpl({
    required this.tmdbDatasource,
  });

  @override
  Future<List<MovieModel>> getTrending() async {
    try {
      final movies = await tmdbDatasource.getTrending();
      return movies;
    } catch (e) {
      return [];
    }
  }
}
