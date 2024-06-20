import '../../models/movie_model.dart';

abstract class TmdbDatasource {
  Future<List<MovieModel>> getTrending();
}
