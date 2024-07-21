import 'package:movie_bloc_app/features/movies/domain/entities/params/params.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';

import '../../data/models/movies_result_model.dart';
import 'usecase.dart';

class GetUpcoming extends Usecase<MoviesResultModel, Params> {
  final MovieRepo repository;

  GetUpcoming(this.repository);

  @override
  Future<MoviesResultModel> call(Params params) async {
    return await repository.getUpcomingMovies(page: params.page!);
  }
}
