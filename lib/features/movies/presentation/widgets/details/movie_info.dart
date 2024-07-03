import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: size.height * 0.15,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary,
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: size.width * 0.35,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.calendar,
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.25),
                      size: size.height * 0.1,
                    ),
                  ),
                ),
                FadeIn(
                  delay: const Duration(milliseconds: 250),
                  child: SizedBox(
                    width: size.width * 0.35,
                    child: Column(
                      children: [
                        const Spacer(),
                        Text(
                          'Release Date',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: size.width * 0.4,
                          child: Text(
                            movie.releaseDate.replaceAll('-', '.'),
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontStyle: FontStyle.italic,
                              color: Colors.orange,
                              shadows: [
                                const Shadow(
                                  color: Colors.orange,
                                  offset: Offset(1, 1),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            VerticalDivider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 2,
              width: size.width * 0.05,
            ),
            Stack(
              children: [
                SizedBox(
                  width: size.width * 0.35,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.solidStar,
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.25),
                      size: size.height * 0.1,
                    ),
                  ),
                ),
                FadeIn(
                  delay: const Duration(milliseconds: 500),
                  child: SizedBox(
                    width: size.width * 0.35,
                    child: Column(
                      children: [
                        const Spacer(),
                        Text(
                          'Vote Average',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: size.width * 0.4,
                          child: Text(
                            movie.voteAverage.toStringAsFixed(2),
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontStyle: FontStyle.italic,
                              color: Colors.orange,
                              shadows: [
                                const Shadow(
                                  color: Colors.orange,
                                  offset: Offset(1, 1),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
