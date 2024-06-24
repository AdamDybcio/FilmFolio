import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/widgets/movie/custom_movie_backdrop.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/home/custom_movie_carousel.dart';

import '../../../../../common/widgets/texts/header.dart';
import '../../widgets/home/browse_movies.dart';
import '../../widgets/home/movie_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.525,
            child: const Stack(
              children: [
                CustomMovieBackdrop(),
                CustomMovieCarousel(),
                MovieTitle(),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          const Header(title: 'Discover Movies'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          const BrowseMovies(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        ],
      ),
    );
  }
}
