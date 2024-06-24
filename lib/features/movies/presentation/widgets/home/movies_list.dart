import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';
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
      child: Container(
        height: size.height * 0.5,
        width: size.width,
        decoration: BoxDecoration(
          color: AppColors.magicWhale.withOpacity(0.5),
        ),
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
