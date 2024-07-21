import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';

import 'package:movie_bloc_app/features/movies/domain/usecases/get_nowplaying.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_popular.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_toprated.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_upcoming.dart';

import '../../../../data/models/movie_model.dart';
import '../../../../domain/entities/params/params.dart';

part 'all_movies_event.dart';
part 'all_movies_state.dart';

class AllMoviesBloc extends Bloc<AllMoviesEvent, AllMoviesState> {
  GetUpcoming getUpcoming;
  GetNowplaying getNowplaying;
  GetToprated getToprated;
  GetPopular getPopular;

  List<MovieModel> allMovies = [];
  int currentPage = 1;
  int maxPages = 0;

  bool isMaxPage = false;

  AllMoviesBloc({
    required this.getUpcoming,
    required this.getNowplaying,
    required this.getToprated,
    required this.getPopular,
  }) : super(AllMoviesInitial()) {
    on<FetchAllMovies>((event, emit) async {
      allMovies.clear();
      currentPage = 1;
      maxPages = 1;
      isMaxPage = false;

      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        emit(const AllMoviesError(message: 'No internet connection'));
        return;
      }

      emit(AllMoviesLoading());

      try {
        if (event.section == 'upcoming') {
          final upcomingMovies = await getUpcoming(Params(page: currentPage));
          allMovies.addAll(upcomingMovies.movies!);
          maxPages = upcomingMovies.totalPages!;
        } else if (event.section == 'now_playing') {
          final nowplayingMovies = await getNowplaying(Params(page: currentPage));
          allMovies.addAll(nowplayingMovies.movies!);
          maxPages = nowplayingMovies.totalPages!;
        } else if (event.section == 'top_rated') {
          final topratedMovies = await getToprated(Params(page: currentPage));
          allMovies.addAll(topratedMovies.movies!);
          maxPages = topratedMovies.totalPages!;
        } else if (event.section == 'popular') {
          final popularMovies = await getPopular(Params(page: currentPage));
          allMovies.addAll(popularMovies.movies!);
          maxPages = popularMovies.totalPages!;
        }

        if (allMovies.isEmpty) {
          emit(const AllMoviesError(message: 'No movies found'));
          return;
        }

        if (currentPage == maxPages) {
          isMaxPage = true;
        }

        emit(AllMoviesLoaded(movies: allMovies, isMaxPage: isMaxPage));
      } catch (e) {
        emit(const AllMoviesError(message: 'Error fetching movies'));
      }
    });
    on<LoadMoreAllMovies>((event, emit) async {
      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        return;
      }

      currentPage++;

      if (currentPage == maxPages) {
        isMaxPage = true;
      }

      try {
        if (event.section == 'upcoming') {
          final upcomingMovies = await getUpcoming(Params(page: currentPage));
          allMovies.addAll(upcomingMovies.movies!);
          maxPages = upcomingMovies.totalPages!;
        } else if (event.section == 'now_playing') {
          final nowplayingMovies = await getNowplaying(Params(page: currentPage));
          allMovies.addAll(nowplayingMovies.movies!);
          maxPages = nowplayingMovies.totalPages!;
        } else if (event.section == 'top_rated') {
          final topratedMovies = await getToprated(Params(page: currentPage));
          allMovies.addAll(topratedMovies.movies!);
          maxPages = topratedMovies.totalPages!;
        } else if (event.section == 'popular') {
          final popularMovies = await getPopular(Params(page: currentPage));
          allMovies.addAll(popularMovies.movies!);
          maxPages = popularMovies.totalPages!;
        }

        emit(AllMoviesLoading());
        emit(AllMoviesLoaded(movies: allMovies, isMaxPage: isMaxPage));
      } catch (e) {
        currentPage--;
        emit(const AllMoviesError(message: 'Error fetching movies'));
      }
    });
  }
}
