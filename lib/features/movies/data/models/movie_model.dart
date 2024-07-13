import 'package:equatable/equatable.dart';

import '../../../personalization/data/models/bookmarked_movie_hive.dart';
import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity with EquatableMixin {
  const MovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.voteAverage,
    required super.releaseDate,
    required super.video,
    required super.adult,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      releaseDate: json['release_date'] ?? '',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      voteAverage: json['vote_average'].toDouble(),
      adult: json['adult'] ?? false,
      video: json['video'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'release_date': releaseDate,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'vote_average': voteAverage,
      'adult': adult,
      'video': video,
    };
  }

  BookmarkedMovie toBookmarkedMovie() {
    return BookmarkedMovie(
      id: id,
      title: title,
      overview: overview,
      releaseDate: releaseDate,
      posterPath: posterPath,
      backdropPath: backdropPath,
      voteAverage: voteAverage,
      adult: adult,
      video: video,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        releaseDate,
        posterPath,
        backdropPath,
        voteAverage,
        adult,
        video,
      ];
}
