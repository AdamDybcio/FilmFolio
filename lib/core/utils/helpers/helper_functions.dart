import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/home_movies/home_movies_bloc.dart';

import '../../../features/movies/presentation/blocs/home/discover_movies_list/discover_movies_bloc.dart';
import '../../../features/movies/presentation/blocs/home/now_playing/now_playing_bloc.dart';
import '../../../features/movies/presentation/blocs/home/top_rated/top_rated_bloc.dart';
import '../../../features/movies/presentation/blocs/home/upcoming/upcoming_bloc.dart';

class HelperFunctions {
  static bool isDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  static void loadMoreMovies(BuildContext context, int type) {
    switch (type) {
      case 1:
        context.read<HomeMoviesBloc>().discoverMoviesBloc.add(FetchNextPageDiscoverMovies());
        break;
      case 2:
        context.read<HomeMoviesBloc>().nowPlayingBloc.add(FetchNowPlayingNextPage());
        break;
      case 3:
        context.read<HomeMoviesBloc>().topRatedBloc.add(FetchTopRatedNextPage());
        break;
      case 4:
        context.read<HomeMoviesBloc>().upcomingBloc.add(FetchUpcomingNextPage());
        break;
      default:
        break;
    }
  }

  static Future<bool> hasConnection() async {
    final result = await InternetConnectionChecker().hasConnection;
    return result;
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.horizontal,
        content: Text(
          message,
          overflow: TextOverflow.ellipsis,
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
