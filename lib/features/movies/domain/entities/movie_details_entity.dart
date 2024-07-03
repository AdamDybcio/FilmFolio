import 'package:equatable/equatable.dart';

import 'genre_entity.dart';

abstract class MovieDetailsEntity extends Equatable {
  final List<GenreEntity> genres;
  final int runtime;
  final int budget;
  final String originalLanguage;

  const MovieDetailsEntity({
    required this.genres,
    required this.runtime,
    required this.budget,
    required this.originalLanguage,
  });

  @override
  List<Object?> get props => [genres, runtime, budget, originalLanguage];

  @override
  bool get stringify => true;
}
