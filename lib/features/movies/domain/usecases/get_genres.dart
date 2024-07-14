import 'package:movie_bloc_app/features/movies/data/models/genre_model.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/params/no_params.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';

import 'usecase.dart';

class GetGenres extends Usecase<List<GenreModel>, NoParams> {
  final MovieRepo repository;

  GetGenres(this.repository);

  @override
  Future<List<GenreModel>> call(NoParams params) async {
    return await repository.getMovieGenres();
  }
}
