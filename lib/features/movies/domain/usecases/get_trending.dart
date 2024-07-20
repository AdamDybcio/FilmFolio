import 'package:movie_bloc_app/features/movies/domain/entities/params/no_params.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';

import '../../data/models/movies_result_model.dart';
import 'usecase.dart';

class GetTrending extends Usecase<MoviesResultModel, NoParams> {
  final MovieRepo repository;

  GetTrending(this.repository);

  @override
  Future<MoviesResultModel> call(NoParams params) async {
    return await repository.getTrendingMovies();
  }
}
