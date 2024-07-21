import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../features/movies/data/models/movie_model.dart';
import '../strings/url_strings.dart';

class UiHelpers {
  BoxDecoration displayImageDecoration(BuildContext context, MovieModel movie, bool isBackdrop) {
    return BoxDecoration(
      image: movie.backdropPath.trim() != '' || movie.posterPath.trim() != ''
          ? DecorationImage(
              image: ExtendedNetworkImageProvider(
                isBackdrop
                    ? (movie.backdropPath != '' ? UrlStrings.imageUrl + movie.backdropPath : UrlStrings.imageUrl + movie.posterPath)
                    : movie.posterPath != ''
                        ? UrlStrings.imageUrl + movie.posterPath
                        : movie.backdropPath,
                cache: true,
                printError: false,
              ),
              fit: BoxFit.cover,
            )
          : null,
      border: Border.all(
        color: Theme.of(context).colorScheme.primary,
        width: 2,
      ),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.secondary,
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  DecorationImage? decorationImage({required MovieModel movie, required bool isPoster}) {
    return movie.backdropPath.trim() != '' || movie.posterPath.trim() != ''
        ? DecorationImage(
            fit: BoxFit.cover,
            image: ExtendedNetworkImageProvider(
              isPoster
                  ? (movie.posterPath != '' ? UrlStrings.imageUrl + movie.posterPath : UrlStrings.imageUrl + movie.backdropPath)
                  : (movie.backdropPath != '' ? UrlStrings.imageUrl + movie.backdropPath : UrlStrings.imageUrl + movie.posterPath),
              cache: true,
              printError: false,
            ),
          )
        : null;
  }
}
