import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/all_movies/all_movies_bloc.dart';
import 'package:movie_bloc_app/features/personalization/presentation/widgets/bookmarks/bookmark_card.dart';

import '../../../data/models/movie_model.dart';

class AllMoviesSection extends StatelessWidget {
  const AllMoviesSection({super.key, required this.movies, required this.isMaxPage, required this.section});

  final List<MovieModel> movies;
  final bool isMaxPage;
  final String section;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        childAspectRatio: 9 / 16,
        padding: const EdgeInsets.all(6),
        crossAxisCount: 3,
        controller: scrollController
          ..addListener(() {
            if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
              context.read<AllMoviesBloc>().add(LoadMoreAllMovies(section));
            }
          }),
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        children: [
          for (final movie in movies) BookmarkCard(movie: movie),
          if (!isMaxPage)
            Center(
              child: LoadingAnimationWidget.beat(color: Theme.of(context).primaryColor, size: 50),
            ),
        ],
      ),
    );
  }
}
