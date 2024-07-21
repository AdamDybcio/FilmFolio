import 'package:movie_bloc_app/features/movies/data/models/review_model.dart';

abstract class ReviewsResultEntity {
  final List<ReviewModel> reviews;
  final int totalPages;

  ReviewsResultEntity({
    required this.reviews,
    required this.totalPages,
  });
}
