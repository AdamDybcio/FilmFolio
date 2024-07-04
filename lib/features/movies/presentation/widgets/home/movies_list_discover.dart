import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/loading_placeholder.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/discover_movies_list/discover_movies_list_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/home/movies_list.dart';

import '../../../../../common/widgets/placeholders/error_placeholder.dart';

class MoviesListDiscover extends StatelessWidget {
  const MoviesListDiscover({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverMoviesListBloc, DiscoverMoviesListState>(
      builder: (_, state) {
        if (state is DiscoverMoviesListInitial) {
          context.read<DiscoverMoviesListBloc>().add(const DiscoverMoviesListLoadEvent(page: 1));
        } else if (state is DiscoverMoviesListError) {
          return ErrorPlaceholder(message: state.message);
        } else if (state is DiscoverMoviesListLoaded) {
          return MoviesList(movies: state.movies, type: 1, hasReachedMax: state.hasReachedMax);
        }
        return const LoadingPlaceholder();
      },
    );
  }
}
