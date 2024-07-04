import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/widgets/texts/header.dart';

import 'movies_list_now_playing.dart';
import 'movies_list_top_rated.dart';
import 'movies_list_upcoming.dart';

class MoreMovies extends StatelessWidget {
  const MoreMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const Header(title: 'Now Playing'),
        const MoviesListNowPlaying(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const Header(title: 'Top Rated'),
        const MoviesListTopRated(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const Header(title: 'Upcoming'),
        const MoviesListUpcoming(),
      ],
    );
  }
}
