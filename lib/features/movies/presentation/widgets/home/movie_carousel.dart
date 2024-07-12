import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/carousel/carousel_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../../core/dependency_injection/di.dart';
import '../../../data/models/movie_model.dart';
import 'movie_carousel_card.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CarouselBloc>(),
      child: BlocBuilder(
        bloc: sl<CarouselBloc>(),
        builder: (context, state) {
          return FadeIn(
            child: CarouselSlider.builder(
              itemCount: movies.length,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.4,
                viewportFraction: 0.6,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  context.read<CarouselBloc>().add(ChangeCarouselMovie(index: index));
                },
              ),
              itemBuilder: (_, index, realIndex) {
                return MovieCarouselCard(movie: movies[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
