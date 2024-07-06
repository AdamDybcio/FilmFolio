import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/backdrop/movie_backdrop_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/trending/trending_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/discover_movies_list/discover_movies_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/genres/genres_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/upcoming/upcoming_bloc.dart';

import '../now_playing/now_playing_bloc.dart';
import '../top_rated/top_rated_bloc.dart';

part 'home_movies_event.dart';
part 'home_movies_state.dart';

class HomeMoviesBloc extends Bloc<HomeMoviesEvent, HomeMoviesState> {
  final UpcomingBloc upcomingBloc;
  final TopRatedBloc topRatedBloc;
  final NowPlayingBloc nowPlayingBloc;
  final DiscoverMoviesBloc discoverMoviesBloc;
  final TrendingBloc trendingBloc;
  final MovieBackdropBloc movieBackdropBloc;

  HomeMoviesBloc({
    required this.upcomingBloc,
    required this.topRatedBloc,
    required this.nowPlayingBloc,
    required this.discoverMoviesBloc,
    required this.trendingBloc,
    required this.movieBackdropBloc,
  }) : super(HomeMoviesInitial()) {
    on<LoadHomeMovies>((event, emit) async {
      emit(HomeMoviesLoading());
      upcomingBloc.add(FetchUpcoming());
      topRatedBloc.add(FetchTopRated());
      nowPlayingBloc.add(FetchNowPlaying());
      movieBackdropBloc.add(const MovieBackdropRefreshEvent());
      discoverMoviesBloc.genresBloc.add(FetchGenres());
      discoverMoviesBloc.add(const FetchDiscoverMovies());
      trendingBloc.add(const FetchTrending());

      await Future.delayed(
        const Duration(seconds: 1),
      ).then((value) {
        emit(HomeMoviesLoaded());
      });
    });
  }
}
