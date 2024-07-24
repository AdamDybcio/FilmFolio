import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';
import 'package:movie_bloc_app/common/widgets/movie/adult_widget.dart';
import 'package:movie_bloc_app/common/widgets/movie/mark_widget.dart';
import 'package:movie_bloc_app/common/widgets/movie/vote_avg_widget.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/search/search/search_bloc.dart';

import '../../../data/models/movie_model.dart';
import 'search_card_image.dart';
import 'search_card_overview.dart';
import 'search_card_title.dart';

class SearchedMoviesList extends StatelessWidget {
  const SearchedMoviesList({
    super.key,
    required this.movies,
    required this.isMaxPage,
  });

  final List<MovieModel> movies;
  final bool isMaxPage;

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();

    return ListView.builder(
      itemCount: isMaxPage ? movies.length : movies.length + 1,
      padding: const EdgeInsets.all(8),
      controller: controller
        ..addListener(() {
          if (controller.position.pixels == controller.position.maxScrollExtent) {
            context.read<SearchBloc>().add(SearchLoadMore());
          }
        }),
      itemBuilder: (context, index) {
        if (index == movies.length && !isMaxPage) {
          return Center(
            child: LoadingAnimationWidget.beat(size: 50, color: Theme.of(context).colorScheme.primary),
          );
        }

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
                            VoteAvgWidget(voteAvg: movie.voteAverage, alignment: Alignment.bottomRight),
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
