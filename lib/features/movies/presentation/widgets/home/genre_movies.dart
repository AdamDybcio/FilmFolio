import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/genre_movies/genre_movies_bloc.dart';
import 'package:movie_bloc_app/features/personalization/presentation/widgets/bookmarks/bookmark_card.dart';

class GenreMovies extends StatelessWidget {
  const GenreMovies({
    super.key,
    required this.movies,
    required this.isMaxPage,
    required this.selectedYear,
    required this.genreId,
  });

  final List<MovieModel> movies;
  final bool isMaxPage;
  final int selectedYear;
  final String genreId;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final yearScrollController = ScrollController();
    final size = MediaQuery.of(context).size;

    List<int> years = List.generate(50, (index) => DateTime.now().year - index);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.075,
            child: Center(
              child: AutoSizeText('Choose a year', style: Theme.of(context).textTheme.titleLarge, maxLines: 1),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            height: size.height * 0.15,
            child: SingleChildScrollView(
              controller: yearScrollController,
              scrollDirection: Axis.vertical,
              child: Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  for (final year in years)
                    FilterChip(
                      label: Text(year.toString()),
                      selected: selectedYear == year,
                      onSelected: (bool selected) {
                        if (selected) {
                          context.read<GenreMoviesBloc>().add(FetchGenreMovies(genreId, year));
                        }
                      },
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: Styles(context: context).cardBoxDecoration.copyWith(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
              child: GridView.count(
                childAspectRatio: 9 / 16,
                padding: const EdgeInsets.all(6),
                crossAxisCount: 3,
                controller: scrollController
                  ..addListener(() {
                    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
                      context.read<GenreMoviesBloc>().add(FetchMoreGenreMovies());
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
            ),
          ),
        ],
      ),
    );
  }
}
