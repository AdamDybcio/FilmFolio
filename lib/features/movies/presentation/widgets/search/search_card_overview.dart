import 'package:flutter/material.dart';

import '../../../data/models/movie_model.dart';

class SearchCardOverview extends StatelessWidget {
  const SearchCardOverview({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: SingleChildScrollView(
          child: Text(movie.overview,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                  )),
        ),
      ),
    );
  }
}
