import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';
import 'package:movie_bloc_app/common/widgets/movie/adult_widget.dart';
import 'package:movie_bloc_app/common/widgets/movie/mark_widget.dart';

import '../../../data/models/movie_model.dart';
import 'search_card_image.dart';
import 'search_card_overview.dart';
import 'search_card_title.dart';

class SearchedMoviesList extends StatelessWidget {
  const SearchedMoviesList({
    super.key,
    required this.movies,
  });

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
            onTap: () {
              context.push('/details/${movie.id}', extra: movie);
            },
            child: FadeIn(
              child: Container(
                decoration: Styles(context: context).cardBoxDecoration,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SearchCardImage(movie: movie),
                      Expanded(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SearchCardTitle(movie: movie),
                                  const SizedBox(height: 20),
                                  SearchCardOverview(movie: movie),
                                ],
                              ),
                            ),
                            MarkWidget(movie: movie),
                            if (movie.adult)
                              const AdultWidget(
                                alignment: Alignment.topRight,
                                padding: EdgeInsets.only(
                                  top: 50,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
