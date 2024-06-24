import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/core/utils/strings/api_strings.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/movie_entity.dart';

class DiscoverMovieCard extends StatelessWidget {
  const DiscoverMovieCard({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dark = HelperFunctions.isDarkMode(context);
    return FadeIn(
      child: Center(
        child: Container(
          width: size.width * 0.8,
          height: size.height * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: dark ? AppColors.diamondCut : AppColors.magicWhale,
              width: 2,
            ),
          ),
          child: Column(
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
                      placeholder: (context, url) => Center(
                        child: Center(child: CircularProgressIndicator(color: dark ? AppColors.diamondCut : AppColors.magicWhale)),
                      ),
                      imageUrl: ApiStrings.imageUrl + movie.posterPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
