import 'package:movie_bloc_app/features/movies/domain/entities/no_params.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';

import '../entities/movie_entity.dart';
import 'usecase.dart';

class GetTrending extends Usecase<List<MovieEntity>, NoParams> {
  final MovieRepo repository;

  GetTrending(this.repository);

  @override
  Future<List<MovieEntity>> call(NoParams params) async {
    return await repository.getTrending();
  }
}
