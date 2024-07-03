import 'package:movie_bloc_app/features/movies/data/models/genre_model.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required super.genres,
    required super.runtime,
    required super.budget,
    required super.originalLanguage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      genres: json['genres'] != null ? List<GenreModel>.from(json['genres'].map((x) => GenreModel.fromJson(x))) : [],
      runtime: json['runtime'] ?? 0,
      budget: json['budget'] ?? 0,
      originalLanguage: json['original_language'] ?? 'en',
    );
  }

  static MovieDetailsModel empty() {
    return const MovieDetailsModel(
      genres: [],
      runtime: 0,
      budget: 0,
      originalLanguage: 'en',
    );
  }
}
