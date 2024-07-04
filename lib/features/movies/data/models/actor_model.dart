import 'package:movie_bloc_app/features/movies/domain/entities/actor_entity.dart';

class ActorModel extends ActorEntity {
  ActorModel({
    required super.name,
    required super.character,
    required super.profilePath,
    required super.id,
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      name: json['name'] ?? '',
      character: json['character'] ?? '',
      profilePath: json['profile_path'] ?? '',
      id: json['id'],
    );
  }
}
