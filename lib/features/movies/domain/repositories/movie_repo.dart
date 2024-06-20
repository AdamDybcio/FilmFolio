import '../../data/models/movie_model.dart';

abstract class MovieRepo {
  Future<List<MovieModel>> getTrending();
}
