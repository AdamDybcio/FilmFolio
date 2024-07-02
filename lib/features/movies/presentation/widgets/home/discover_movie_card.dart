import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_bloc_app/core/utils/strings/api_strings.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

class DiscoverMovieCard extends StatelessWidget {
  const DiscoverMovieCard({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        context.push('/details/${movie.id}', extra: movie);
      },
      child: FadeIn(
        child: Center(
          child: Container(
            width: size.width * 0.75,
            height: size.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 2,
                color: Theme.of(context).colorScheme.secondary,
              ),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                  BlendMode.srcOver,
                ),
                image: CachedNetworkImageProvider(
                  movie.backdropPath != '' ? ApiStrings.imageUrl + movie.backdropPath : ApiStrings.imageUrl + movie.posterPath,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: size.height * 0.3,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 5,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      borderRadius: BorderRadius.circular(17.5),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: movie.posterPath != ''
                          ? CachedNetworkImage(
                              imageUrl: ApiStrings.imageUrl + movie.posterPath,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(
                                child: LoadingAnimationWidget.beat(color: Theme.of(context).colorScheme.primary, size: 50),
                              ),
                            )
                          : const Center(
                              child: Icon(
                                Icons.image_not_supported,
                                size: 50,
                                color: Colors.red,
                              ),
                            ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: size.height * 0.1,
                    width: size.width * 0.7,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(17.5), bottomRight: Radius.circular(17.5)),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          movie.title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.clip,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: size.height * 0.075,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                movie.voteAverage.toStringAsFixed(1),
                                overflow: TextOverflow.fade,
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                              const SizedBox(width: 10),
                              const FaIcon(
                                FontAwesomeIcons.solidStar,
                                size: 30,
                                color: Colors.yellow,
                                shadows: [
                                  Shadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 2,
                                  ),
                                  Shadow(
                                    offset: Offset(-1, -1),
                                    blurRadius: 2,
                                  ),
                                  Shadow(
                                    offset: Offset(1, -1),
                                    blurRadius: 2,
                                  ),
                                  Shadow(
                                    offset: Offset(-1, 1),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
