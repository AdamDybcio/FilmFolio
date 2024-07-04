import 'package:flutter/material.dart';

import '../../../data/models/movie_model.dart';

class DiscoverMovieCardTitle extends StatelessWidget {
  const DiscoverMovieCardTitle({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: size.height * 0.1,
          width: size.width * 0.7,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Theme.of(context).colorScheme.secondary,
            ),
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.secondary,
                spreadRadius: 4,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
