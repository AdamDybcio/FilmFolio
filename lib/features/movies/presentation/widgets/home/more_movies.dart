import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/header.dart';
import 'more_movies_list.dart';

class MoreMovies extends StatelessWidget {
  const MoreMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        const Header(title: 'Now Playing'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.005),
        const MoreMoviesList(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        const Header(title: 'Top Rated Movies'),
        const MoreMoviesList(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.005),
        const Header(title: 'Upcoming Movies'),
        const MoreMoviesList(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
      ],
    );
  }
}
