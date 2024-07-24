import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';
import 'package:movie_bloc_app/common/widgets/movie/movie_card.dart';
import 'package:movie_bloc_app/common/widgets/texts/header.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/details/details/details_bloc.dart';

import '../../../features/movies/data/models/movie_model.dart';

class MoviesSection extends StatelessWidget {
  const MoviesSection({super.key, required this.movies, this.isSimilar = false, this.isHomePage = false, this.isMaxPage = true});

  final List<MovieModel> movies;
  final bool isSimilar;
  final bool isHomePage;
  final bool isMaxPage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ScrollController controller = ScrollController();

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
            itemCount: isMaxPage ? movies.length : movies.length + 1,
            scrollDirection: Axis.horizontal,
            controller: controller
              ..addListener(() {
                if (controller.position.pixels == controller.position.maxScrollExtent && !isMaxPage) {
                  context.read<DetailsBloc>().add(LoadMoreSimilar());
                }
              }),
            itemBuilder: (_, index) {
              if (index == movies.length && !isMaxPage) {
                return Center(child: LoadingAnimationWidget.beat(size: 50, color: Theme.of(context).colorScheme.primary));
              }

              final movie = movies[index];
              return FadeIn(
                child: MovieCard(
                  movie: movie,
                  verticalPadding: 2,
                  horizontalPadding: 2,
                  isHomePage: isHomePage,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
