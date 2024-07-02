import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/movies/presentation/blocs/home/backdrop/movie_backdrop_bloc.dart';
import '../../../features/movies/presentation/blocs/home/carousel/movie_carousel_bloc.dart';
import '../../../features/movies/presentation/blocs/home/discover_movies_list/discover_movies_list_bloc.dart';
import '../../../features/movies/presentation/blocs/home/genres/genres_bloc.dart';
import '../../../features/movies/presentation/blocs/home/now_playing/now_playing_bloc.dart';
import '../../../features/movies/presentation/blocs/home/top_rated/top_rated_bloc.dart';
import '../../../features/movies/presentation/blocs/home/upcoming/upcoming_bloc.dart';

class HelperFunctions {
  static bool isDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  static Future<void> refreshHomePage(BuildContext context) async {
    context.read<MovieBackdropBloc>().add(const MovieBackdropRefreshEvent());
    context.read<MovieCarouselBloc>().add(const CarouselLoadEvent());
    context.read<GenresBloc>().add(GenresLoadEvent());
    context.read<DiscoverMoviesListBloc>().add(const DiscoverMoviesListLoadEvent(page: 1));
    context.read<UpcomingBloc>().add(FetchUpcoming());
    context.read<TopRatedBloc>().add(FetchTopRated());
    context.read<NowPlayingBloc>().add(FetchNowPlaying());
    return Future.delayed(const Duration(seconds: 1));
  }

  static void loadMoreMovies(BuildContext context, int type) {
    switch (type) {
      case 1:
        context.read<DiscoverMoviesListBloc>().add(DiscoverMoviesListFetchNextPage());
        break;
      case 2:
        context.read<NowPlayingBloc>().add(FetchNowPlayingNextPage());
        break;
      case 3:
        context.read<TopRatedBloc>().add(FetchTopRatedNextPage());
        break;
      case 4:
        context.read<UpcomingBloc>().add(FetchUpcomingNextPage());
        break;
      default:
        break;
    }
  }
}
