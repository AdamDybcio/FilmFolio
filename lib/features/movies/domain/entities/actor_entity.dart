abstract class ActorEntity {
  String name;
  String? profilePath;
  String character;

  ActorEntity({
    required this.name,
    this.profilePath,
    required this.character,
  });
}
