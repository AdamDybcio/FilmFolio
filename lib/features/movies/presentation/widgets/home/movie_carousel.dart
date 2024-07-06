import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/movie/movie_card.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/error_placeholder.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/backdrop/movie_backdrop_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/home_movies/home_movies_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/trending/trending_bloc.dart';
import 'package:animate_do/animate_do.dart';

import '../../../../../common/widgets/placeholders/loading_placeholder.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<HomeMoviesBloc>().trendingBloc,
      builder: (_, state) {
        if (state is TrendingLoaded) {
          context.read<HomeMoviesBloc>().movieBackdropBloc.add(MovieBackdropChangedEvent(state.movies[0]));
          return FadeIn(
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
            child: CarouselSlider.builder(
              itemCount: state.movies.length,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.4,
                aspectRatio: 16 / 9,
                viewportFraction: 0.6,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  context.read<HomeMoviesBloc>().movieBackdropBloc.add(MovieBackdropChangedEvent(state.movies[index]));
                },
              ),
              itemBuilder: (_, index, realIndex) {
                return MovieCard(movie: state.movies[index], height: MediaQuery.of(context).size.height * 0.4);
              },
            ),
          );
        } else if (state is TrendingError) {
          return ErrorPlaceholder(
            height: 0.5,
            width: 1,
            message: state.message,
          );
        }
        return const LoadingPlaceholder();
      },
    );
  }
}
