import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';
import 'package:movie_bloc_app/common/widgets/movie/movie_card.dart';

import '../../../data/models/movie_model.dart';

class MoviesUpcoming extends StatelessWidget {
  const MoviesUpcoming({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
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
              aspectRatio: 10 / 16,
              verticalPadding: 2,
              horizontalPadding: 2,
            ),
          );
        },
      ),
    );
  }
}
