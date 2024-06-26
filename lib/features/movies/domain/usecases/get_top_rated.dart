import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/no_params.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';

import 'usecase.dart';

class GetTopRated extends Usecase<List<MovieModel>, NoParams> {
  final MovieRepo repository;

  GetTopRated(this.repository);

  @override
  Future<List<MovieModel>> call(NoParams params) async {
    return await repository.getTopRated();
  }
}
