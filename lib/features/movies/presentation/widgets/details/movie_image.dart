import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/utils/strings/api_strings.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:movie_bloc_app/common/widgets/movie/movie_card.dart';

import 'adult_only.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                movie.backdropPath != '' ? ApiStrings.imageUrl + movie.backdropPath : ApiStrings.imageUrl + movie.posterPath,
              ),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.secondary,
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
        Center(
          child: MovieCard(
            movie: movie,
            touchable: false,
            width: 150,
            height: 250,
          ),
        ),
        if (movie.adult) const AdultOnly(),
      ],
    );
  }
}
