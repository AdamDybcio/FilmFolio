import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';

import '../../data/models/movies_result_model.dart';
import '../entities/params/params.dart';
import 'usecase.dart';

class GetToprated extends Usecase<MoviesResultModel, Params> {
  final MovieRepo repository;

  GetToprated(this.repository);

  @override
  Future<MoviesResultModel> call(Params params) async {
    return await repository.getTopRatedMovies(page: params.page!);
  }
}
