import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/widgets/texts/header.dart';

import 'movies_list_discover.dart';
import 'genres_tabbar.dart';
import 'years_tabbar.dart';

class BrowseMovies extends StatelessWidget {
  const BrowseMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(title: 'Discover'),
        const GenresTabBar(),
        const YearsTabBar(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const MoviesListDiscover(),
      ],
    );
  }
}
