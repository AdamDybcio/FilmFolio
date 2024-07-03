import 'package:movie_bloc_app/features/movies/data/models/genre_model.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';

import '../../domain/repositories/movie_repo.dart';
import '../datasources/remote/tmdb_datasource.dart';
import '../models/movies_result_model.dart';

class MovieRepoImpl extends MovieRepo {
  final TmdbDatasource tmdbDatasource;

  MovieRepoImpl({
    required this.tmdbDatasource,
  });

  @override
  Future<MoviesResultModel> getTrending({int page = 1}) async {
    try {
      final movies = await tmdbDatasource.getTrending(page: page);
      return movies;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<GenreModel>> getGenres() {
    try {
      final genres = tmdbDatasource.getGenres();
      return genres;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<MoviesResultModel> getDiscoverMovies({required GenreModel genre, required int year, int page = 1}) {
    try {
      final movies = tmdbDatasource.getDiscoverMovies(genre: genre, year: year, page: page);
      return movies;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<MoviesResultModel> getNowPlaying({int page = 1}) {
    try {
      final movies = tmdbDatasource.getNowPlaying(page: page);
      return movies;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<MoviesResultModel> getTopRated({int page = 1}) {
    try {
      final movies = tmdbDatasource.getTopRated(page: page);
      return movies;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<MoviesResultModel> getUpcoming({int page = 1}) {
    try {
      final movies = tmdbDatasource.getUpcoming(page: page);
      return movies;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails({required int movieId}) {
    try {
      final movie = tmdbDatasource.getMovieDetails(id: movieId);
      return movie;
    } catch (e) {
      throw Exception(e);
    }
  }
}
