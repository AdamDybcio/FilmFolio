import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_bloc_app/core/utils/helpers/ui_helpers.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie, this.touchable = true, this.width = double.infinity, this.height = 300});

  final MovieModel movie;
  final double width;
  final double height;
  final bool touchable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: touchable
          ? () {
              context.push('/details/${movie.id}', extra: movie);
            }
          : null,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 2, right: 2, bottom: 16),
        child: Container(
          width: width,
          height: height,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, 3),
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
            color: Theme.of(context).scaffoldBackgroundColor,
            image: UiHelpers().decorationImage(movie: movie, isPoster: true),
          ),
        ),
      ),
    );
  }
}
