import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/strings/url_strings.dart';
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
        child: movie.posterPath.trim() != ''
            ? ExtendedImage.network(
                '${UrlStrings.imageUrl}${movie.posterPath}',
                cache: true,
                printError: false,
                fit: BoxFit.cover,
              )
            : FittedBox(
                fit: BoxFit.cover,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: const FaIcon(
                    FontAwesomeIcons.film,
                    color: Colors.white,
                  ),
                )),
      ),
    );
  }
}
