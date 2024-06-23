import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/movie/custom_movie_card.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/backdrop/movie_backdrop_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/carousel/movie_carousel_bloc.dart';
import 'package:animate_do/animate_do.dart';

import '../../../../../common/widgets/placeholders/custom_placeholder.dart';

class CustomMovieCarousel extends StatelessWidget {
  const CustomMovieCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    final size = MediaQuery.of(context).size;
    return BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
      builder: (_, state) {
        if (state is MovieCarouselLoaded) {
          context.read<MovieBackdropBloc>().add(MovieBackdropChangedEvent(state.movies[0]));
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
                  context.read<MovieBackdropBloc>().add(MovieBackdropChangedEvent(state.movies[index]));
                },
              ),
              itemBuilder: (_, index, realIndex) {
                return Stack(
                  children: [
                    CustomMovieCard(movie: state.movies[index]),
                  ],
                );
              },
            ),
          );
        } else if (state is MovieCarouselError) {
          return CustomPlaceholder(
            height: size.height * 0.45,
            width: size.width,
            child: FadeIn(
              child: Text(
                state.message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: darkMode ? AppColors.blackHowl : AppColors.diamondCut,
                    ),
              ),
            ),
          );
        }
        return CustomPlaceholder(
          height: size.height * 0.45,
          width: size.width,
          child: CircularProgressIndicator(color: darkMode ? AppColors.blackHowl : AppColors.diamondCut),
        );
      },
    );
  }
}
