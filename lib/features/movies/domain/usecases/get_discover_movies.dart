import 'package:movie_bloc_app/features/movies/domain/entities/params.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';

import '../../data/models/movies_result_model.dart';
import 'usecase.dart';

class GetDiscoverMovies extends Usecase<MoviesResultModel, Params> {
  final MovieRepo repository;

  GetDiscoverMovies(this.repository);

  @override
  Future<MoviesResultModel> call(Params params) async {
    return await repository.getDiscoverMovies(genre: params.genre, year: params.year, page: params.page);
  }
}
