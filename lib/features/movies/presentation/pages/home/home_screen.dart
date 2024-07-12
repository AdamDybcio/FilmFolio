import 'package:animate_do/animate_do.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/error_placeholder.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/loading_placeholder.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/home_movies/home_movies_bloc.dart';
import 'package:movie_bloc_app/features/personalization/presentation/blocs/bloc/bookmarks_bloc.dart';

import '../../widgets/home/browse_movies.dart';
import '../../widgets/home/main_movies.dart';
import '../../widgets/home/more_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<HomeMoviesBloc>(),
      builder: (context, state) {
        if (state is HomeMoviesInitial) {
          context.read<HomeMoviesBloc>().add(LoadHomeMovies());
          context.read<BookmarksBloc>().add(LoadBookmarks());
          return FadeIn(
            child: Center(
              child: Text(
                'Please wait...',
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.fade,
              ),
            ),
          );
        } else {
          return FadeIn(
            child: CustomMaterialIndicator(
              indicatorBuilder: (context, _) {
                return LoadingAnimationWidget.beat(
                  color: Theme.of(context).colorScheme.primary,
                  size: 50,
                );
              },
              onRefresh: () {
                context.read<HomeMoviesBloc>().add(LoadHomeMovies());
                return Future.delayed(const Duration(seconds: 1));
              },
              child: SingleChildScrollView(
                child: Column(
                  children: state is HomeMoviesError
                      ? [FadeIn(child: Center(child: ErrorPlaceholder(message: state.message)))]
                      : state is HomeMoviesLoading
                          ? [FadeIn(child: const Center(child: LoadingPlaceholder()))]
                          : const [
                              MainMovies(),
                              BrowseMovies(),
                              MoreMovies(),
                              SizedBox(height: 50),
                            ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
