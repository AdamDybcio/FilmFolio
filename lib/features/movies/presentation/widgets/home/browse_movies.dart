import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/header.dart';
import 'discover_movies_list.dart';
import 'genres_tabbar.dart';
import 'years_tabbar.dart';

class BrowseMovies extends StatelessWidget {
  const BrowseMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        const Header(title: 'Discover Movies'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.005),
        const GenresTabBar(),
        const YearsTabBar(),
        const SizedBox(height: 20),
        const DiscoverMoviesList(),
      ],
    );
  }
}
