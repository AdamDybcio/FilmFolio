import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/widgets/movie/custom_movie_backdrop.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/home/custom_movie_carousel.dart';

import '../../widgets/home/movie_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CustomMovieBackdrop(),
              CustomMovieCarousel(),
              MovieTitle(),
            ],
          ),
        ],
      ),
    );
  }
}
