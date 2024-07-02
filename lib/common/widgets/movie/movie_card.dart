import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_bloc_app/core/utils/strings/api_strings.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/movie_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie, this.touchable = true, this.width = double.infinity, this.height = 300});

  final MovieEntity movie;
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
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                movie.backdropPath != '' ? ApiStrings.imageUrl + movie.backdropPath : ApiStrings.imageUrl + movie.posterPath,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
