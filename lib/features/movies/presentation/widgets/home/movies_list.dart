import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/home/discover_movie_card.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    super.key,
    required this.movies,
    required this.type,
    required this.hasReachedMax,
  });

  final List<MovieModel> movies;
  final int type;
  final bool hasReachedMax;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final ScrollController controller = ScrollController();

    return FadeIn(
      child: Container(
        height: size.height * 0.55,
        width: size.width,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.tertiary,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: ListView.separated(
          controller: controller
            ..addListener(() async {
              if (controller.position.maxScrollExtent == controller.offset && !hasReachedMax) {
                if (await HelperFunctions.hasConnection()) {
                  // ignore: use_build_context_synchronously
                  HelperFunctions.loadMoreMovies(context, type);
                }
              }
            }),
          itemCount: (!hasReachedMax ? movies.length + 1 : movies.length),
          separatorBuilder: (context, index) {
            return const SizedBox(width: 15);
          },
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            if (index < movies.length) {
              final movie = movies[index];
              return Row(
                children: [
                  if (index == 0) const SizedBox(width: 15),
                  DiscoverMovieCard(movie: movie),
                ],
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Center(
                  child: LoadingAnimationWidget.beat(color: Theme.of(context).colorScheme.tertiary, size: 50),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
