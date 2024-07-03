import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../data/models/movie_model.dart';

class DiscoverMovieCardInfo extends StatelessWidget {
  const DiscoverMovieCardInfo({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: size.height * 0.075,
              width: size.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
                color: Colors.black.withOpacity(0.8),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary,
                    spreadRadius: 4,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      movie.voteAverage.toStringAsFixed(1) == '10.0' ? '10' : movie.voteAverage.toStringAsFixed(1),
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.orange,
                        shadows: const [
                          Shadow(
                            offset: Offset(0.5, 0.5),
                            blurRadius: 1,
                            color: Colors.orange,
                          ),
                          Shadow(
                            offset: Offset(-0.5, -0.5),
                            blurRadius: 1,
                            color: Colors.orange,
                          ),
                          Shadow(
                            offset: Offset(0.5, -0.5),
                            blurRadius: 1,
                            color: Colors.orange,
                          ),
                          Shadow(
                            offset: Offset(-0.5, 0.5),
                            blurRadius: 1,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                    const FaIcon(
                      FontAwesomeIcons.solidStar,
                      size: 30,
                      color: Colors.yellow,
                      shadows: [
                        Shadow(
                          offset: Offset(0.5, 0.5),
                          blurRadius: 2,
                          color: Colors.yellow,
                        ),
                        Shadow(
                          offset: Offset(-0.5, -0.5),
                          blurRadius: 2,
                          color: Colors.yellow,
                        ),
                        Shadow(
                          offset: Offset(0.5, -0.5),
                          blurRadius: 2,
                          color: Colors.yellow,
                        ),
                        Shadow(
                          offset: Offset(-0.5, 0.5),
                          blurRadius: 2,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: size.height * 0.075,
              width: size.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
                color: Colors.black.withOpacity(0.8),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary,
                    spreadRadius: 4,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      movie.adult ? FontAwesomeIcons.x : FontAwesomeIcons.check,
                      size: 30,
                      color: movie.adult ? Theme.of(context).colorScheme.error : Colors.green,
                      shadows: [
                        Shadow(
                          offset: const Offset(0.5, 0.5),
                          blurRadius: 2,
                          color: movie.adult ? Theme.of(context).colorScheme.error : Colors.green,
                        ),
                        Shadow(
                          offset: const Offset(-0.5, -0.5),
                          blurRadius: 2,
                          color: movie.adult ? Theme.of(context).colorScheme.error : Colors.green,
                        ),
                        Shadow(
                          offset: const Offset(0.5, -0.5),
                          blurRadius: 2,
                          color: movie.adult ? Theme.of(context).colorScheme.error : Colors.green,
                        ),
                        Shadow(
                          offset: const Offset(-0.5, 0.5),
                          blurRadius: 2,
                          color: movie.adult ? Theme.of(context).colorScheme.error : Colors.green,
                        ),
                      ],
                    ),
                    const FaIcon(
                      FontAwesomeIcons.child,
                      size: 30,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(0.5, 0.5),
                          blurRadius: 2,
                          color: Colors.white,
                        ),
                        Shadow(
                          offset: Offset(-0.5, -0.5),
                          blurRadius: 2,
                          color: Colors.white,
                        ),
                        Shadow(
                          offset: Offset(0.5, -0.5),
                          blurRadius: 2,
                          color: Colors.white,
                        ),
                        Shadow(
                          offset: Offset(-0.5, 0.5),
                          blurRadius: 2,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
