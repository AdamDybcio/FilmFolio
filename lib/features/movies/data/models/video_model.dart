import 'package:movie_bloc_app/features/movies/domain/entities/video_entity.dart';

class VideoModel extends VideoEntity {
  VideoModel({
    required super.id,
    required super.key,
    required super.name,
    required super.site,
    required super.type,
    required super.official,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      key: json['key'] ?? '',
      name: json['name'] ?? '',
      site: json['site'] ?? '',
      official: json['officlal'] ?? false,
      type: json['type'] ?? '',
    );
  }
}
