import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/custom_movie_card.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/carousel/movie_carousel_bloc.dart';
import 'package:animate_do/animate_do.dart';

class CustomMovieCarousel extends StatelessWidget {
  const CustomMovieCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
      builder: (_, state) {
        if (state is MovieCarouselLoaded) {
          return FadeIn(
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
            child: CarouselSlider.builder(
              itemCount: state.movies.length,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.6,
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
              ),
              itemBuilder: (_, index, realIndex) {
                return Column(
                  children: [
                    CustomMovieCard(movie: state.movies[index]),
                    const SizedBox(height: 5),
                    Text(
                      state.movies[index].title,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          );
        }
        return Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Center(child: CircularProgressIndicator(color: darkMode ? AppColors.diamondCut : AppColors.blackHowl)),
          ),
        );
      },
    );
  }
}
