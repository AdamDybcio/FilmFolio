import 'package:movie_bloc_app/features/movies/data/models/genre_model.dart';

import '../../data/models/movie_model.dart';

abstract class MovieRepo {
  Future<List<MovieModel>> getTrending();

  Future<List<GenreModel>> getGenres();

  Future<List<MovieModel>> getDiscoverMovies({
    required GenreModel genre,
    required int year,
  });

  Future<List<MovieModel>> getNowPlaying();

  Future<List<MovieModel>> getTopRated();

  Future<List<MovieModel>> getUpcoming();
}
