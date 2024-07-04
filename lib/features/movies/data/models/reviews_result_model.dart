import 'package:movie_bloc_app/features/movies/data/models/review_model.dart';

import '../../domain/entities/reviews_result_entity.dart';

class ReviewsResultModel extends ReviewsResultEntity {
  ReviewsResultModel({
    required super.reviews,
    required super.totalPages,
  });

  factory ReviewsResultModel.fromJson(Map<String, dynamic> json) {
    return ReviewsResultModel(
      reviews: json['results'] != null ? List<ReviewModel>.from(json['results'].map((x) => ReviewModel.fromJson(x))) : [],
      totalPages: json['total_pages'] ?? 0,
    );
  }

  static ReviewsResultModel empty() {
    return ReviewsResultModel(
      reviews: [],
      totalPages: 0,
    );
  }
}
