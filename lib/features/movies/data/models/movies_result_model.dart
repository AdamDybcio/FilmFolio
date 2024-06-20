import 'movie_model.dart';

class MoviesResultModel {
  List<MovieModel>? movies;

  MoviesResultModel({this.movies});

  MoviesResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      movies = <MovieModel>[];
      json['results'].forEach((v) {
        movies!.add(MovieModel.fromJson(v));
      });
    }
  }
}
