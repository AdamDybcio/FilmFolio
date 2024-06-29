import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/core/utils/strings/api_strings.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/movie_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomMovieCard extends StatelessWidget {
  const CustomMovieCard({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        context.push('/details/${movie.id}', extra: movie);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 2, right: 2, bottom: 16),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: darkMode ? AppColors.diamondCut.withOpacity(0.3) : AppColors.blackHowl.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(ApiStrings.imageUrl + movie.posterPath),
            ),
          ),
        ),
      ),
    );
  }
}
