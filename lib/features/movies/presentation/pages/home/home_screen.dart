import 'package:animate_do/animate_do.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_bloc_app/common/widgets/texts/centered_message.dart';
import 'package:movie_bloc_app/common/widgets/texts/header.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/home/home_bloc.dart';
import 'package:movie_bloc_app/features/personalization/presentation/blocs/bookmarks/bookmarks_bloc.dart';

import '../../widgets/home/movie_carousel.dart';
import '../../widgets/home/movie_genres.dart';
import '../../widgets/home/movies_upcoming.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder(
      bloc: context.read<HomeBloc>(),
      builder: (context, state) {
        if (state is HomeInitial) {
          context.read<HomeBloc>().add(LoadHome());
          context.read<BookmarksBloc>().add(LoadBookmarks());
          return const CenteredMessage(message: 'Please wait...');
        } else if (state is HomeLoading) {
          return FadeIn(
            child: CustomMaterialIndicator(
              indicatorBuilder: (context, _) {
                return LoadingAnimationWidget.beat(
                  color: Theme.of(context).colorScheme.primary,
                  size: 50,
                );
              },
              onRefresh: () {
                context.read<HomeBloc>().add(LoadHome());
                return Future.delayed(const Duration(seconds: 1));
              },
              child: SingleChildScrollView(
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                  child: const CenteredMessage(message: 'Loading...'),
                ),
              ),
            ),
          );
        } else if (state is HomeError) {
          return FadeIn(
            child: CustomMaterialIndicator(
              indicatorBuilder: (context, _) {
                return LoadingAnimationWidget.beat(
                  color: Theme.of(context).colorScheme.primary,
                  size: 50,
                );
              },
              onRefresh: () {
                context.read<HomeBloc>().add(LoadHome());
                return Future.delayed(const Duration(seconds: 1));
              },
              child: SingleChildScrollView(
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                  child: CenteredMessage(message: state.message),
                ),
              ),
            ),
          );
        } else if (state is HomeLoaded) {
          return FadeIn(
            child: CustomMaterialIndicator(
              indicatorBuilder: (context, _) {
                return LoadingAnimationWidget.beat(
                  color: Theme.of(context).colorScheme.primary,
                  size: 50,
                );
              },
              onRefresh: () {
                context.read<HomeBloc>().add(LoadHome());
                return Future.delayed(const Duration(seconds: 1));
              },
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      MovieCarousel(movies: state.popularMovies.movies!),
                      Header(
                        title: 'Upcoming Movies',
                        onTap: () {
                          //TODO: Navigate to upcoming movies
                        },
                      ),
                      MoviesUpcoming(movies: state.upcomingMovies.movies!),
                      SizedBox(height: size.height * 0.05),
                      const Header(title: 'Movie Genres'),
                      MovieGenres(genres: state.genres),
                      SizedBox(height: size.height * 0.05),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
