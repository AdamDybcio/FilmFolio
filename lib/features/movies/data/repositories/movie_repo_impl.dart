import 'package:movie_bloc_app/features/movies/data/models/genre_model.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

import '../../domain/repositories/movie_repo.dart';
import '../datasources/remote/tmdb_datasource.dart';

class MovieRepoImpl extends MovieRepo {
  final TmdbDatasource tmdbDatasource;

  MovieRepoImpl({
    required this.tmdbDatasource,
  });

  @override
  Future<List<MovieModel>> getTrending() async {
    try {
      final movies = await tmdbDatasource.getTrending();
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
  Future<List<MovieModel>> getDiscoverMovies({required GenreModel genre, required int year}) {
    try {
      final movies = tmdbDatasource.getDiscoverMovies(genre: genre, year: year);
      return movies;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<MovieModel>> getNowPlaying() {
    try {
      final movies = tmdbDatasource.getNowPlaying();
      return movies;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<MovieModel>> getTopRated() {
    try {
      final movies = tmdbDatasource.getTopRated();
      return movies;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<MovieModel>> getUpcoming() {
    try {
      final movies = tmdbDatasource.getUpcoming();
      return movies;
    } catch (e) {
      throw Exception(e);
    }
  }
}
