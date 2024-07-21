import 'package:movie_bloc_app/features/movies/data/models/reviews_result_model.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/params/params.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';

import 'usecase.dart';

class GetMovieReviews extends Usecase<ReviewsResultModel, Params> {
  final MovieRepo repository;

  GetMovieReviews(this.repository);

  @override
  Future<ReviewsResultModel> call(Params params) async {
    return await repository.getMovieReviews(movieId: params.id!, page: params.page!);
  }
}
