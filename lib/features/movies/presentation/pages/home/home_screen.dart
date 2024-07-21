import 'package:animate_do/animate_do.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_bloc_app/common/widgets/texts/centered_message.dart';
import 'package:movie_bloc_app/common/widgets/texts/header.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/home/home_bloc.dart';
import 'package:movie_bloc_app/features/personalization/presentation/blocs/bookmarks/bookmarks_bloc.dart';
import 'package:movie_bloc_app/features/personalization/presentation/blocs/settings/settings_bloc.dart';

import '../../widgets/home/movie_carousel.dart';
import '../../widgets/home/movie_genres.dart';
import '../../../../../common/widgets/movie/movies_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state2) {
        if (state2 is SettingsChanged) {
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
                            MovieCarousel(movies: state2.showAdultContent ? state.trendingMovies.movies! : state.trendingMovies.movies!.where((movie) => !movie.adult).toList()),
                            Header(
                              title: 'Upcoming Movies',
                              onTap: () {
                                context.push('/all/upcoming', extra: 'Upcoming Movies');
                              },
                            ),
                            MoviesSection(
                              movies: state2.showAdultContent ? state.upcomingMovies.movies! : state.upcomingMovies.movies!.where((movie) => !movie.adult).toList(),
                              isHomePage: true,
                            ),
                            SizedBox(height: size.height * 0.05),
                            const Header(title: 'Movie Genres'),
                            MovieGenres(genres: state.genres),
                            SizedBox(height: size.height * 0.05),
                            Header(
                              title: 'Now Playing Movies',
                              onTap: () {
                                context.push('/all/now_playing', extra: 'Now Playing Movies');
                              },
                            ),
                            MoviesSection(
                              movies: state2.showAdultContent ? state.nowPlayingMovies.movies! : state.nowPlayingMovies.movies!.where((movie) => !movie.adult).toList(),
                              isHomePage: true,
                            ),
                            SizedBox(height: size.height * 0.05),
                            Header(
                              title: 'Top Rated Movies',
                              onTap: () {
                                context.push('/all/top_rated', extra: 'Top Rated Movies');
                              },
                            ),
                            MoviesSection(
                              movies: state2.showAdultContent ? state.topRatedMovies.movies! : state.topRatedMovies.movies!.where((movie) => !movie.adult).toList(),
                              isHomePage: true,
                            ),
                            SizedBox(height: size.height * 0.05),
                            Header(
                              title: 'Popular Movies',
                              onTap: () {
                                context.push('/all/popular', extra: 'Popular Movies');
                              },
                            ),
                            MoviesSection(
                              movies: state2.showAdultContent ? state.popularMovies.movies! : state.popularMovies.movies!.where((movie) => !movie.adult).toList(),
                              isHomePage: true,
                            ),
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
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
