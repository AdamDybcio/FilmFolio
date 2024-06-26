import 'package:movie_bloc_app/features/movies/domain/entities/params.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';

import '../../data/models/movie_model.dart';
import 'usecase.dart';

class GetDiscoverMovies extends Usecase<List<MovieModel>, Params> {
  final MovieRepo repository;

  GetDiscoverMovies(this.repository);

  @override
  Future<List<MovieModel>> call(Params params) async {
    return await repository.getDiscoverMovies(genre: params.genre, year: params.year);
  }
}
