import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/upcoming/upcoming_bloc.dart';

import '../../../../../common/widgets/placeholders/custom_placeholder.dart';
import 'movies_list.dart';

class UpcomingMoviesList extends StatelessWidget {
  const UpcomingMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    HelperFunctions.isDarkMode(context);
    return BlocBuilder<UpcomingBloc, UpcomingState>(builder: (_, state) {
      if (state is UpcomingError) {
        return CustomPlaceholder(
          height: size.height * 0.55,
          width: size.width,
          child: FadeIn(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FaIcon(FontAwesomeIcons.solidFaceSadTear, size: 50),
                SizedBox(height: size.height * 0.05),
                Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
        );
      } else if (state is UpcomingSuccess) {
        return MoviesList(movies: state.movies, type: 4, hasReachedMax: state.hasReachedMax);
      }
      return CustomPlaceholder(
        height: size.height * 0.55,
        width: size.width,
        play: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoadingAnimationWidget.beat(color: Theme.of(context).colorScheme.primary, size: 50),
            SizedBox(height: size.height * 0.05),
            Text('Loading...', style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      );
    });
  }
}
