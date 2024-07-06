import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/loading_placeholder.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/discover_movies_list/discover_movies_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/home_movies/home_movies_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/home/movies_list.dart';

import '../../../../../common/widgets/placeholders/error_placeholder.dart';

class MoviesListDiscover extends StatelessWidget {
  const MoviesListDiscover({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<HomeMoviesBloc>().discoverMoviesBloc,
      builder: (_, state) {
        if (state is DiscoverMoviesInitial) {
          context.read<HomeMoviesBloc>().discoverMoviesBloc.add(const FetchDiscoverMovies());
        } else if (state is DiscoverMoviesError) {
          return ErrorPlaceholder(message: state.message);
        } else if (state is DiscoverMoviesLoaded) {
          return MoviesList(movies: state.movies, type: 1, hasReachedMax: state.hasReachedMax);
        }
        return const LoadingPlaceholder();
      },
    );
  }
}
