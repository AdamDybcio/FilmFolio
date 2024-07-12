import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

part 'bookmarked_movie_hive.g.dart';

@HiveType(typeId: 0)
class BookmarkedMovie extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String posterPath;
  @HiveField(3)
  final String overview;
  @HiveField(4)
  final String releaseDate;
  @HiveField(5)
  final double voteAverage;
  @HiveField(6)
  final String backdropPath;
  @HiveField(7)
  final bool video;
  @HiveField(8)
  final bool adult;

  BookmarkedMovie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.backdropPath,
    required this.video,
    required this.adult,
  });

  MovieModel toMovieModel() {
    return MovieModel(
      id: id,
      title: title,
      posterPath: posterPath,
      overview: overview,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      backdropPath: backdropPath,
      video: video,
      adult: adult,
    );
  }
}
