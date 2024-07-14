import 'package:movie_bloc_app/features/movies/data/models/genre_model.dart';
import 'package:movie_bloc_app/features/movies/data/models/reviews_result_model.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/movie_details_entity.dart';

import 'actor_model.dart';
import 'production_company_model.dart';
import 'video_model.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required super.genres,
    required super.runtime,
    required super.budget,
    required super.originalLanguage,
    required super.productionCompanies,
    required super.videos,
    required super.actors,
    required super.reviews,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      genres: json['genres'] != null ? List<GenreModel>.from(json['genres'].map((x) => GenreModel.fromJson(x))) : [],
      runtime: json['runtime'] ?? -1,
      budget: json['budget'] ?? -1,
      originalLanguage: json['original_language'] ?? 'UNKNOWN',
      productionCompanies:
          json['production_companies'] != null ? List<ProductionCompanyModel>.from(json['production_companies'].map((x) => ProductionCompanyModel.fromJson(x))) : [],
      videos: json['videos']['results'] != null ? List<VideoModel>.from(json['videos']['results'].map((x) => VideoModel.fromJson(x))) : [],
      actors: json['credits']['cast'] != null ? List<ActorModel>.from(json['credits']['cast'].map((x) => ActorModel.fromJson(x))) : [],
      reviews: json['reviews'] != null ? ReviewsResultModel.fromJson(json['reviews']) : ReviewsResultModel.empty(),
    );
  }

  static MovieDetailsModel empty() {
    return MovieDetailsModel(
      genres: const [],
      runtime: -1,
      budget: -1,
      originalLanguage: 'UNKNOWN',
      productionCompanies: const [],
      videos: const [],
      actors: const [],
      reviews: ReviewsResultModel.empty(),
    );
  }
}
