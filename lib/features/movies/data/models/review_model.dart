import 'package:movie_bloc_app/features/movies/domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  ReviewModel({
    required super.author,
    required super.content,
    required super.createdAt,
    required super.avatarPath,
    required super.rating,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      author: json['author'] ?? '',
      content: json['content'] ?? '',
      createdAt: json['created_at'] ?? '',
      avatarPath: json['author_details']['avatar_path'] ?? '',
      rating: json['author_details']['rating'] ?? 0,
    );
  }
}
