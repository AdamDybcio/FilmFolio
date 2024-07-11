import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/search/search/search_bloc.dart';

import 'searched_movies_list.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<SearchBloc>(),
      builder: (context, state) {
        if (state is SearchLoaded) {
          return Expanded(
            child: SearchedMoviesList(movies: state.movies),
          );
        } else if (state is SearchInitial && context.read<SearchBloc>().movies.isNotEmpty) {
          return Expanded(
            child: SearchedMoviesList(movies: context.read<SearchBloc>().movies),
          );
        }

        return Expanded(
          child: FadeIn(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state is SearchLoading)
                  LoadingAnimationWidget.beat(
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                if (state is SearchInitial || state is SearchEmpty)
                  FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                if (state is SearchNoInternet || state is SearchError)
                  FaIcon(
                    FontAwesomeIcons.solidFaceSadTear,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                const SizedBox(height: 30),
                Text(
                  state is SearchNoInternet
                      ? 'No internet connection'
                      : state is SearchError
                          ? 'An error occurred'
                          : state is SearchInitial
                              ? 'Search for movies'
                              : state is SearchLoading
                                  ? 'Loading...'
                                  : 'No movies found',
                  style: Theme.of(context).textTheme.titleLarge,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
