import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/top_rated/top_rated_bloc.dart';

import '../../../../../common/widgets/placeholders/custom_placeholder.dart';
import 'movies_list.dart';

class TopRatedMoviesList extends StatelessWidget {
  const TopRatedMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final darkMode = HelperFunctions.isDarkMode(context);
    return BlocBuilder<TopRatedBloc, TopRatedState>(builder: (_, state) {
      if (state is TopRatedError) {
        return CustomPlaceholder(
          height: size.height * 0.55,
          width: size.width,
          child: FadeIn(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.solidFaceSadTear, size: 50, color: darkMode ? AppColors.coolFrost : AppColors.magicWhale),
                SizedBox(height: size.height * 0.05),
                Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: darkMode ? AppColors.diamondCut : AppColors.magicWhale,
                      ),
                ),
              ],
            ),
          ),
        );
      } else if (state is TopRatedSuccess) {
        return MoviesList(movies: state.movies);
      }
      return CustomPlaceholder(
        height: size.height * 0.55,
        width: size.width,
        play: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: darkMode ? AppColors.coolFrost : AppColors.magicWhale),
            SizedBox(height: size.height * 0.05),
            Text('Loading...', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      );
    });
  }
}
