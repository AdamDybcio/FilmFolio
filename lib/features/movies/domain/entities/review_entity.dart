abstract class ReviewEntity {
  final String author;
  final String avatarPath;
  final double rating;
  final String content;
  final String createdAt;

  const ReviewEntity({
    required this.author,
    required this.content,
    required this.createdAt,
    required this.avatarPath,
    required this.rating,
  });
}
