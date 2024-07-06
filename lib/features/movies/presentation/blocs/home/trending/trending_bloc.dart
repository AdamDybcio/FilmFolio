import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_trending.dart';

import '../../../../domain/entities/page_param.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final GetTrending getTrending;
  final List<MovieModel> allMovies = [];
  int currentPage = 1;
  int currentIndex = 0;
  int maxPages = 0;

  TrendingBloc({required this.getTrending}) : super(TrendingInitial()) {
    on<FetchTrending>((event, emit) async {
      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        emit(const TrendingError('No internet connection.'));
        return;
      }

      emit(TrendingLoading());
      allMovies.clear();
      currentIndex = 0;
      currentPage = 1;
      maxPages = 0;
      try {
        final movies = await getTrending(PageParam());

        currentIndex = event.currentIndex;

        if (movies.movies!.isEmpty) {
          emit(const TrendingError('No movies found.'));
          return;
        }

        allMovies.addAll(movies.movies!);
        maxPages = movies.totalPages!;

        if (currentPage < maxPages) {
          emit(TrendingLoaded(
            movies: allMovies,
            currentIndex: currentIndex,
            false,
          ));
        } else {
          emit(TrendingLoaded(
            movies: allMovies,
            currentIndex: currentIndex,
            true,
          ));
        }
      } catch (e) {
        emit(const TrendingError('There was an error.\nPlease try again later.'));
      }
    });
    on<CarouselFetchNextPage>((event, emit) async {
      currentPage++;
      if (currentPage > maxPages) return;
      try {
        final movies = await getTrending(PageParam(page: currentPage));
        allMovies.addAll(movies.movies!);
        emit(TrendingLoading());
        if (currentPage < maxPages) {
          emit(TrendingLoaded(
            movies: allMovies,
            currentIndex: currentIndex,
            false,
          ));
        } else {
          emit(TrendingLoaded(
            movies: allMovies,
            currentIndex: currentIndex,
            true,
          ));
        }
      } catch (e) {
        emit(const TrendingError('There was an error.\nPlease try again later.'));
      }
    });
  }
}
