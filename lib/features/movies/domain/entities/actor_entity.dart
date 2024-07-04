abstract class ActorEntity {
  int id;
  String name;
  String profilePath;
  String character;

  ActorEntity({
    required this.name,
    required this.profilePath,
    required this.character,
    required this.id,
  });
}
