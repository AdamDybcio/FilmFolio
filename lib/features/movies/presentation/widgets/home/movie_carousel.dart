import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/home/movie_card.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/backdrop/movie_backdrop_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/carousel/movie_carousel_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../common/widgets/placeholders/custom_placeholder.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({super.key});

  @override
  Widget build(BuildContext context) {
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
                return MovieCard(movie: state.movies[index]);
              },
            ),
          );
        } else if (state is MovieCarouselError) {
          return CustomPlaceholder(
            height: size.height * 0.5,
            width: size.width,
            child: FadeIn(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FaIcon(FontAwesomeIcons.solidFaceSadTear, size: 50),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
          );
        }
        return CustomPlaceholder(
          height: size.height * 0.5,
          width: size.width,
          play: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoadingAnimationWidget.beat(color: Theme.of(context).colorScheme.primary, size: 50),
              SizedBox(height: size.height * 0.05),
              Text('Loading...', style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        );
      },
    );
  }
}
