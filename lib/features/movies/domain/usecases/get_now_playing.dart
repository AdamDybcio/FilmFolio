import 'package:movie_bloc_app/features/movies/domain/entities/page_param.dart';
import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';

import '../../data/models/movies_result_model.dart';
import 'usecase.dart';

class GetNowPlaying extends Usecase<MoviesResultModel, PageParam> {
  final MovieRepo repository;

  GetNowPlaying(this.repository);

  @override
  Future<MoviesResultModel> call(PageParam params) async {
    return await repository.getNowPlaying(page: params.page);
  }
}
