import 'package:movie_bloc_app/features/movies/domain/entities/genre_entity.dart';

class GenreModel extends GenreEntity {
  const GenreModel({required super.id, required super.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
