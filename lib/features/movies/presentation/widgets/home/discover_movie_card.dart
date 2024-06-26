import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/core/utils/strings/api_strings.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

class DiscoverMovieCard extends StatelessWidget {
  const DiscoverMovieCard({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        //TODO: Navigate to movie details page
      },
      child: FadeIn(
        child: Center(
          child: Container(
            width: size.width * 0.75,
            height: size.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: dark ? AppColors.diamondCut : AppColors.magicWhale,
                width: 2,
              ),
              image: DecorationImage(
                image: CachedNetworkImageProvider(ApiStrings.imageUrl + movie.backdropPath),
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
                        color: AppColors.autumnBlaze,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(17.5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: ApiStrings.imageUrl + movie.posterPath,
                        fit: BoxFit.cover,
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
                        color: AppColors.autumnBlaze.withOpacity(0.75),
                        width: 2,
                      ),
                      color: AppColors.autumnBlaze.withOpacity(0.6),
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(17.5), bottomRight: Radius.circular(17.5)),
                    ),
                    child: Center(
                      child: Text(
                        movie.title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.diamondCut,
                              fontWeight: FontWeight.bold,
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
                        color: AppColors.autumnBlaze.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.autumnBlaze,
                          width: 2,
                        ),
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
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: AppColors.diamondCut,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(width: 10),
                              FaIcon(FontAwesomeIcons.solidStar, size: 30, color: AppColors.autumnBlaze),
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
