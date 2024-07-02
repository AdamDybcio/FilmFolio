import 'package:equatable/equatable.dart';

abstract class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final String releaseDate;
  final bool video;
  final bool adult;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.video,
    required this.adult,
  });

  @override
  List<Object?> get props => [id, title];

  @override
  bool get stringify => true;
}
