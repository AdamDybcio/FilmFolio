import 'package:movie_bloc_app/features/movies/data/models/genre_model.dart';

class Params {
  final GenreModel genre;
  final int year;
  final int page;
  final int id;

  Params({this.genre = const GenreModel(id: 28, name: 'Action'), this.year = 2024, this.page = 1, this.id = 0});
}
