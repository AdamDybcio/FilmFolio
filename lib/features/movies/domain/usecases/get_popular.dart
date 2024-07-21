import 'package:movie_bloc_app/features/movies/domain/entities/params/params.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';

import '../../data/models/movies_result_model.dart';
import 'usecase.dart';

class GetPopular extends Usecase<MoviesResultModel, Params> {
  final MovieRepo repository;

  GetPopular(this.repository);

  @override
  Future<MoviesResultModel> call(Params params) async {
    return await repository.getPopularMovies(page: params.page!);
  }
}
