import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/texts/centered_message.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/search/search/search_bloc.dart';
import 'package:movie_bloc_app/features/personalization/presentation/blocs/settings/settings_bloc.dart';

import 'searched_movies_list.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state2) {
        if (state2 is SettingsChanged) {
          return BlocBuilder(
            bloc: context.read<SearchBloc>(),
            builder: (context, state) {
              if (state is SearchLoaded) {
                return Expanded(
                  child: SearchedMoviesList(movies: state2.showAdultContent ? state.movies : state.movies.where((movie) => !movie.adult).toList()),
                );
              } else if (state is SearchInitial && context.read<SearchBloc>().movies.isNotEmpty) {
                return Expanded(
                  child: SearchedMoviesList(
                      movies: state2.showAdultContent ? context.read<SearchBloc>().movies : context.read<SearchBloc>().movies.where((movie) => !movie.adult).toList()),
                );
              }

              return Expanded(
                child: CenteredMessage(
                  message: state is SearchNoInternet
                      ? 'No internet connection'
                      : state is SearchError
                          ? 'Error'
                          : state is SearchInitial
                              ? 'Search for movies'
                              : state is SearchLoading
                                  ? 'Loading...'
                                  : 'No movies found',
                ),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
