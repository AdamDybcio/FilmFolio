import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_bloc_app/core/utils/strings/api_strings.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

import 'discover_movie_card_info.dart';
import 'discover_movie_card_image.dart';
import 'discover_movie_card_title.dart';

class DiscoverMovieCard extends StatelessWidget {
  const DiscoverMovieCard({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        context.push('/details/${movie.id}', extra: movie);
      },
      child: FadeIn(
        child: Center(
          child: Container(
            width: size.width * 0.75,
            height: size.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary,
                  spreadRadius: 4,
                  blurRadius: 3,
                  offset: const Offset(0, 3),
                ),
              ],
              color: Theme.of(context).scaffoldBackgroundColor,
              image: movie.backdropPath != '' || movie.posterPath != ''
                  ? DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3),
                        BlendMode.srcOver,
                      ),
                      image: CachedNetworkImageProvider(
                        movie.backdropPath != '' ? ApiStrings.imageUrl + movie.backdropPath : ApiStrings.imageUrl + movie.posterPath,
                      ),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Stack(
              children: [
                DiscoverMovieCardImage(movie: movie),
                DiscoverMovieCardTitle(movie: movie),
                DiscoverMovieCardInfo(movie: movie),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
