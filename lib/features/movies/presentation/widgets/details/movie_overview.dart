import 'package:flutter/widgets.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

class MovieOverview extends StatelessWidget {
  const MovieOverview({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(movie.overview),
      ],
    );
  }
}
