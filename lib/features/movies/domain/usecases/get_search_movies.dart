import 'package:movie_bloc_app/features/movies/data/models/movies_result_model.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/usecase.dart';

import '../entities/params/params.dart';

class GetSearchMovies extends Usecase<MoviesResultModel, Params> {
  final MovieRepo repository;

  GetSearchMovies(this.repository);

  @override
  Future<MoviesResultModel> call(Params params) async {
    return await repository.searchMovies(query: params.query!);
  }
}
