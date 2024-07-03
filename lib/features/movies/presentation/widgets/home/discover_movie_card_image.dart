import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/strings/api_strings.dart';
import '../../../data/models/movie_model.dart';

class DiscoverMovieCardImage extends StatelessWidget {
  const DiscoverMovieCardImage({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          height: size.height * 0.3,
          width: size.width * 0.4,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.tertiary,
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).scaffoldBackgroundColor,
            image: movie.posterPath != '' ? DecorationImage(image: CachedNetworkImageProvider(ApiStrings.imageUrl + movie.posterPath), fit: BoxFit.cover) : null,
          ),
        ),
      ),
    );
  }
}
