import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/error_placeholder.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/loading_placeholder.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/home_movies/home_movies_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/top_rated/top_rated_bloc.dart';

import 'movies_list.dart';

class MoviesListTopRated extends StatelessWidget {
  const MoviesListTopRated({super.key});

  @override
  Widget build(BuildContext context) {
    HelperFunctions.isDarkMode(context);
    return BlocBuilder(
      bloc: context.read<HomeMoviesBloc>().topRatedBloc,
      builder: (_, state) {
        if (state is TopRatedSuccess) {
          return MoviesList(movies: state.movies, type: 3, hasReachedMax: state.hasReachedMax);
        } else if (state is TopRatedError) {
          return ErrorPlaceholder(message: state.message);
        }
        return const LoadingPlaceholder();
      },
    );
  }
}
