import 'package:movie_bloc_app/features/movies/domain/usecases/usecase.dart';

import '../../data/models/movie_details_model.dart';
import '../entities/params/params.dart';
import '../repositories/movie_repo.dart';

class GetMovieDetails extends Usecase<MovieDetailsModel, Params> {
  final MovieRepo repository;

  GetMovieDetails(this.repository);

  @override
  Future<MovieDetailsModel> call(Params params) async {
    return await repository.getMovieDetails(movieId: params.id!);
  }
}
