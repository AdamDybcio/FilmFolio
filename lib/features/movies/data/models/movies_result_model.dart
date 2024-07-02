import 'movie_model.dart';

class MoviesResultModel {
  List<MovieModel>? movies;
  int? totalPages;

  MoviesResultModel({this.movies, this.totalPages});

  MoviesResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      movies = <MovieModel>[];
      json['results'].forEach((v) {
        movies!.add(MovieModel.fromJson(v));
      });
    } else {
      movies = [];
    }
    if (json['total_pages'] != null) {
      totalPages = json['total_pages'];
    } else {
      totalPages = 0;
    }
  }
}
