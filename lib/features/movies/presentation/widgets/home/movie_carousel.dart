import 'package:flutter/material.dart';

import '../../../data/models/movie_model.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: Container(
        width: double.infinity,
      ),
    );
  }
}
