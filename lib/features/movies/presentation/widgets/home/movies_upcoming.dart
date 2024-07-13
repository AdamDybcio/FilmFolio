import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/home/movie_carousel_card.dart';

import '../../../data/models/movie_model.dart';

class MoviesUpcoming extends StatelessWidget {
  const MoviesUpcoming({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          decoration: Styles(context: context).cardBoxDecoration.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
          child: ListView.builder(
            itemCount: movies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final movie = movies[index];
              return MovieCarouselCard(
                movie: movie,
                aspectRatio: 9 / 16,
                verticalPadding: 2,
                horizontalPadding: 2,
              );
            },
          ),
        ),
      ),
    );
  }
}
