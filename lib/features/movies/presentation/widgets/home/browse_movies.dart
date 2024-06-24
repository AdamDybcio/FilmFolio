import 'package:flutter/material.dart';

import 'discover_movies_list.dart';
import 'genres_tabbar.dart';
import 'years_tabbar.dart';

class BrowseMovies extends StatelessWidget {
  const BrowseMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GenresTabBar(),
        YearsTabBar(),
        SizedBox(height: 20),
        DiscoverMoviesList(),
      ],
    );
  }
}
