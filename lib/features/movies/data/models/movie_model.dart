import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final String originalTitle;
  final String? mediaType;
  final bool adult;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final bool video;
  final int? voteCount;

  const MovieModel({
    required this.originalTitle,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.video,
    required this.voteCount,
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      voteAverage: json['vote_average'].toDouble(),
      originalTitle: json['original_title'],
      mediaType: json['media_type'],
      adult: json['adult'],
      originalLanguage: json['original_language'],
      genreIds: List<int>.from(json['genre_ids']),
      popularity: json['popularity'].toDouble(),
      video: json['video'],
      voteCount: json['vote_count'],
    );
  }
}
