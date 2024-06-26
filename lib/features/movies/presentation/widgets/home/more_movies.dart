import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/header.dart';
import 'now_playing_movies_list.dart';
import 'top_rated_movies_list.dart';
import 'upcoming_movies_list.dart';

class MoreMovies extends StatelessWidget {
  const MoreMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const Header(title: 'Now Playing'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.005),
        const NowPlayingMoviesList(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const Header(title: 'Top Rated Movies'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.005),
        const TopRatedMoviesList(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const Header(title: 'Upcoming Movies'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.005),
        const UpcomingMoviesList(),
      ],
    );
  }
}
