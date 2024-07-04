import 'package:movie_bloc_app/features/movies/domain/entities/review_entity.dart';

abstract class ReviewsResultEntity {
  final List<ReviewEntity> reviews;
  final int totalPages;

  ReviewsResultEntity({
    required this.reviews,
    required this.totalPages,
  });
}
