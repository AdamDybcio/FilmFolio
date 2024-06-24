import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/home/discover_movie_card.dart';

import '../../../domain/entities/movie_entity.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    super.key,
    required this.movies,
  });

  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeIn(
      child: SizedBox(
        height: size.height * 0.5,
        width: size.width,
        child: ListView.separated(
          itemCount: movies.length,
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10);
          },
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final movie = movies[index];
            return DiscoverMovieCard(movie: movie);
          },
        ),
      ),
    );
  }
}
