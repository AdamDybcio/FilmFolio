import 'package:movie_bloc_app/features/movies/domain/entities/params/params.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';

import '../../data/models/movies_result_model.dart';
import 'usecase.dart';

class GetMoviesByGenre extends Usecase<MoviesResultModel, Params> {
  final MovieRepo repository;

  GetMoviesByGenre(this.repository);

  @override
  Future<MoviesResultModel> call(Params params) async {
    return await repository.getMoviesByGenre(
      page: params.page!,
      genreId: int.parse(params.genreId!),
      year: params.year!,
    );
  }
}
