import 'package:equatable/equatable.dart';

import 'actor_entity.dart';
import 'genre_entity.dart';
import 'production_company_entity.dart';
import 'reviews_result_entity.dart';
import 'video_entity.dart';

abstract class MovieDetailsEntity extends Equatable {
  final List<GenreEntity> genres;
  final int runtime;
  final int budget;
  final String originalLanguage;
  final List<ProductionCompanyEntity> productionCompanies;
  final List<VideoEntity> videos;
  final List<ActorEntity> actors;
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
