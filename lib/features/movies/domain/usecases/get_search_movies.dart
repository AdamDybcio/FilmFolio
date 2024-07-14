import 'package:movie_bloc_app/features/movies/data/models/movies_result_model.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/params/search_param.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/usecase.dart';

class GetSearchMovies extends Usecase<MoviesResultModel, SearchParam> {
  final MovieRepo repository;

  GetSearchMovies(this.repository);

  @override
  Future<MoviesResultModel> call(SearchParam params) async {
    return await repository.searchMovies(query: params.query);
  }
}
