abstract class VideoEntity {
  String id;
  String key;
  String name;
  String site;
  String type;
  bool official;

  VideoEntity({
    required this.id,
    required this.key,
    required this.name,
    required this.site,
    required this.type,
    required this.official,
  });
}
