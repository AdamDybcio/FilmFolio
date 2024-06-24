import 'package:movie_bloc_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/params.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';

import 'usecase.dart';

class GetDiscoverMovies extends Usecase<List<MovieEntity>, Params> {
  final MovieRepo repository;

  GetDiscoverMovies(this.repository);

  @override
  Future<List<MovieEntity>> call(Params params) async {
    return await repository.getDiscoverMovies(genre: params.genre, year: params.year);
  }
}
