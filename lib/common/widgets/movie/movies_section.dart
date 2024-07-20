import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';
import 'package:movie_bloc_app/common/widgets/movie/movie_card.dart';
import 'package:movie_bloc_app/common/widgets/texts/header.dart';

import '../../../features/movies/data/models/movie_model.dart';

class MoviesSection extends StatelessWidget {
  const MoviesSection({super.key, required this.movies, this.isSimilar = false});

  final List<MovieModel> movies;
  final bool isSimilar;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        if (isSimilar) SizedBox(height: size.height * 0.035),
        if (isSimilar) const Header(title: 'Similar Movies'),
        Container(
          height: size.height * 0.35,
          width: double.infinity,
          decoration: Styles(context: context).cardBoxDecoration.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
          child: ListView.builder(
            itemCount: movies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final movie = movies[index];
              return FadeIn(
                child: MovieCard(
                  movie: movie,
                  verticalPadding: 2,
                  horizontalPadding: 2,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
