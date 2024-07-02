import 'package:movie_bloc_app/features/movies/data/models/genre_model.dart';

class Params {
  final GenreModel genre;
  final int year;
  final int page;

  Params({required this.genre, required this.year, required this.page});
}
