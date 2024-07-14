import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/features/movies/data/models/actor_model.dart';
import 'package:movie_bloc_app/features/movies/data/models/genre_model.dart';
import 'package:movie_bloc_app/features/movies/data/models/production_company_model.dart';
import 'package:movie_bloc_app/features/movies/data/models/video_model.dart';

import 'reviews_result_entity.dart';

abstract class MovieDetailsEntity extends Equatable {
  final List<GenreModel> genres;
  final int runtime;
  final int budget;
  final String originalLanguage;
  final List<ProductionCompanyModel> productionCompanies;
  final List<VideoModel> videos;
  final List<ActorModel> actors;
  final ReviewsResultEntity reviews;

  const MovieDetailsEntity({
    required this.genres,
    required this.runtime,
    required this.budget,
    required this.originalLanguage,
    required this.productionCompanies,
    required this.videos,
    required this.actors,
    required this.reviews,
  });

  @override
  List<Object?> get props => [genres, runtime, budget, originalLanguage, productionCompanies, videos, actors, reviews];

  @override
  bool get stringify => true;
}
