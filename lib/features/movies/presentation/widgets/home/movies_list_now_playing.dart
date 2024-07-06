import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/error_placeholder.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/loading_placeholder.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/home_movies/home_movies_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/now_playing/now_playing_bloc.dart';

import 'movies_list.dart';

class MoviesListNowPlaying extends StatelessWidget {
  const MoviesListNowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<HomeMoviesBloc>().nowPlayingBloc,
      builder: (_, state) {
        if (state is NowPlayingError) {
          return ErrorPlaceholder(message: state.message);
        } else if (state is NowPlayingSuccess) {
          return MoviesList(movies: state.movies, type: 2, hasReachedMax: state.hasReachedMax);
        }
        return const LoadingPlaceholder();
      },
    );
  }
}
