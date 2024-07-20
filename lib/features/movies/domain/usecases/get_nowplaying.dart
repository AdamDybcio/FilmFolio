import 'package:movie_bloc_app/features/movies/domain/repositories/movie_repo.dart';

import '../../data/models/movies_result_model.dart';
import '../entities/params/page_param.dart';
import 'usecase.dart';

class GetNowplaying extends Usecase<MoviesResultModel, PageParam> {
  final MovieRepo repository;

  GetNowplaying(this.repository);

  @override
  Future<MoviesResultModel> call(PageParam params) async {
    return await repository.getNowPlayingMovies(page: params.page);
  }
}
