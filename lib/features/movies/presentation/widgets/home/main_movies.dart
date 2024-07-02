import 'package:flutter/material.dart';

import 'movie_backdrop.dart';
import 'movie_carousel.dart';
import 'movie_title.dart';

class MainMovies extends StatelessWidget {
  const MainMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.525,
      child: const Stack(
        children: [
          MovieBackdrop(),
          MovieCarousel(),
          MovieTitle(),
        ],
      ),
    );
  }
}
