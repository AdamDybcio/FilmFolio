import 'package:flutter/material.dart';

import '../../../data/models/movie_model.dart';

class SearchCardTitle extends StatelessWidget {
  const SearchCardTitle({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          movie.title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
