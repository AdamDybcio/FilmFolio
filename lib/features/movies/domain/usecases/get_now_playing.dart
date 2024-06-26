import 'package:movie_bloc_app/features/movies/domain/entities/no_params.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';

import '../../data/models/movie_model.dart';
import 'usecase.dart';

class GetNowPlaying extends Usecase<List<MovieModel>, NoParams> {
  final MovieRepo repository;

  GetNowPlaying(this.repository);

  @override
  Future<List<MovieModel>> call(NoParams params) async {
    return await repository.getNowPlaying();
  }
}
