import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/features/movies/data/models/movies_result_model.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/params/page_param.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_genres.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_nowplaying.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_popular.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_toprated.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_trending.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_upcoming.dart';

import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../data/models/genre_model.dart';
import '../../../../data/models/movie_model.dart';
import '../../../../domain/entities/params/no_params.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetGenres getGenres;
  final GetUpcoming getUpcoming;
  final GetPopular getPopular;
  final GetNowplaying getNowPlaying;
  final GetToprated getTopRated;
  final GetTrending getTrending;

  //Popular
  List<MovieModel> popularMovies = [];

  //Upcoming
  List<MovieModel> upcomingMovies = [];

  //Genres
  List<GenreModel> genres = [];

  //Now Playing
  List<MovieModel> nowPlayingMovies = [];

  //Top Rated
  List<MovieModel> topRatedMovies = [];

  //Trending
  List<MovieModel> trendingMovies = [];

  HomeBloc({
    required this.getGenres,
    required this.getPopular,
    required this.getUpcoming,
    required this.getNowPlaying,
    required this.getTopRated,
    required this.getTrending,
  }) : super(HomeInitial()) {
    on<LoadHome>((event, emit) async {
      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        emit(const HomeError('No internet connection'));
        return;
      }

      emit(HomeLoading());

      try {
        final popularResult = await getPopular(PageParam());

        if (popularResult.movies!.isEmpty) {
          emit(const HomeError('Error while fetching data'));
        } else {
          popularMovies = popularResult.movies!;
        }

        final upcomingResult = await getUpcoming(PageParam());

        if (upcomingResult.movies!.isEmpty) {
          emit(const HomeError('Error while fetching data'));
        } else {
          upcomingMovies = upcomingResult.movies!;
        }

        final genresResult = await getGenres(NoParams());

        if (genresResult.isEmpty) {
          emit(const HomeError('Error while fetching data'));
        } else {
          genres = genresResult;
        }

        final nowPlayingResult = await getNowPlaying(PageParam());

        if (nowPlayingResult.movies!.isEmpty) {
          emit(const HomeError('Error while fetching data'));
        } else {
          nowPlayingMovies = nowPlayingResult.movies!;
        }

        final topRatedResult = await getTopRated(PageParam());
        if (topRatedResult.movies!.isEmpty) {
          emit(const HomeError('Error while fetching data'));
        } else {
          topRatedMovies = topRatedResult.movies!;
        }

        final trendingResult = await getTrending(NoParams());

        if (trendingResult.movies!.isEmpty) {
          emit(const HomeError('Error while fetching data'));
        } else {
          trendingMovies = trendingResult.movies!;
          emit(HomeLoaded(
            popularMovies: popularResult,
            upcomingMovies: upcomingResult,
            genres: genresResult,
            nowPlayingMovies: nowPlayingResult,
            topRatedMovies: topRatedResult,
            trendingMovies: trendingResult,
          ));
        }
      } catch (e) {
        emit(const HomeError('Error while fetching data'));
      }
    });
  }
}
