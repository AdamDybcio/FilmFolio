import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';

import '../../widgets/home/browse_movies.dart';
import '../../widgets/home/main_movies.dart';
import '../../widgets/home/more_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomMaterialIndicator(
      indicatorBuilder: (context, _) {
        return LoadingAnimationWidget.beat(
          color: Theme.of(context).colorScheme.primary,
          size: 50,
        );
      },
      onRefresh: () => HelperFunctions.refreshHomePage(context),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            MainMovies(),
            BrowseMovies(),
            MoreMovies(),
          ],
        ),
      ),
    );
  }
}
