import 'package:equatable/equatable.dart';

abstract class GenreEntity extends Equatable {
  final int id;
  final String name;

  const GenreEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];

  @override
  bool get stringify => true;
}
