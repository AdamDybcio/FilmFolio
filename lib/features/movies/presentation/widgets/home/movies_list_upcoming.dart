import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/error_placeholder.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/loading_placeholder.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/upcoming/upcoming_bloc.dart';

import 'movies_list.dart';

class MoviesListUpcoming extends StatelessWidget {
  const MoviesListUpcoming({super.key});

  @override
  Widget build(BuildContext context) {
    HelperFunctions.isDarkMode(context);
    return BlocBuilder<UpcomingBloc, UpcomingState>(builder: (_, state) {
      if (state is UpcomingSuccess) {
        return MoviesList(movies: state.movies, type: 4, hasReachedMax: state.hasReachedMax);
      } else if (state is UpcomingError) {
        return ErrorPlaceholder(message: state.message);
      }
      return const LoadingPlaceholder();
    });
  }
}
