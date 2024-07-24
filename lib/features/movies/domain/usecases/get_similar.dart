import 'package:movie_bloc_app/features/movies/domain/entities/params/params.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';

import '../../data/models/movies_result_model.dart';
import 'usecase.dart';

class GetSimilar extends Usecase<MoviesResultModel, Params> {
  final MovieRepo repository;

  GetSimilar(this.repository);

  @override
  Future<MoviesResultModel> call(Params params) async {
    return await repository.getSimilarMovies(movieId: params.id!, page: params.page!);
  }
}
