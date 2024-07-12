import 'package:flutter/material.dart';

import 'package:movie_bloc_app/core/utils/helpers/ui_helpers.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:movie_bloc_app/common/widgets/movie/movie_card.dart';

import 'adult_only.dart';
import 'bookmark_details.dart';

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
          decoration: UiHelpers().displayImageDecoration(context, movie, true),
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
        BookmarkDetails(movie: movie),
      ],
    );
  }
}
