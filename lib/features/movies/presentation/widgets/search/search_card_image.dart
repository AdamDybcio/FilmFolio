import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/strings/api_strings.dart';
import '../../../data/models/movie_model.dart';

class SearchCardImage extends StatelessWidget {
  const SearchCardImage({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 10 / 16,
        child: movie.posterPath != ''
            ? CachedNetworkImage(
                imageUrl: '${ApiStrings.imageUrl}${movie.posterPath}',
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const FaIcon(
                  FontAwesomeIcons.film,
                  color: Colors.white,
                  size: 30,
                ),
              )
            : const Center(
                child: FaIcon(
                FontAwesomeIcons.film,
                size: 30,
                color: Colors.white,
              )),
      ),
    );
  }
}
