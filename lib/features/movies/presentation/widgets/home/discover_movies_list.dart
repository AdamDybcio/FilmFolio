import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/discover_movies_list/discover_movies_list_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/home/movies_list.dart';

import '../../../../../common/widgets/placeholders/custom_placeholder.dart';

class DiscoverMoviesList extends StatelessWidget {
  const DiscoverMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<DiscoverMoviesListBloc, DiscoverMoviesListState>(
      builder: (_, state) {
        if (state is DiscoverMoviesListInitial) {
          context.read<DiscoverMoviesListBloc>().add(const DiscoverMoviesListLoadEvent(page: 1));
        } else if (state is DiscoverMoviesListError) {
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
        } else if (state is DiscoverMoviesListLoaded) {
          return MoviesList(movies: state.movies, type: 1, hasReachedMax: state.hasReachedMax);
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
      },
    );
  }
}
