import 'package:movie_bloc_app/features/movies/data/models/genre_model.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';

import '../../data/models/movies_result_model.dart';

abstract class MovieRepo {
  Future<MoviesResultModel> getTrending({int page = 1});

  Future<List<GenreModel>> getGenres();

  Future<MoviesResultModel> getDiscoverMovies({
    required GenreModel genre,
    required int year,
    int page = 1,
  });

  Future<MoviesResultModel> getNowPlaying({int page = 1});

  Future<MoviesResultModel> getTopRated({int page = 1});

  Future<MoviesResultModel> getUpcoming({int page = 1});

  Future<MovieDetailsModel> getMovieDetails({required int movieId});

  Future<MoviesResultModel> searchMovies({required String query});
}
