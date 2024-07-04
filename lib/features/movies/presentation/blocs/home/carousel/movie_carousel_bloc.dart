import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_trending.dart';

import '../../../../domain/entities/page_param.dart';
import '../backdrop/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;
  final List<MovieModel> allMovies = [];
  int currentPage = 1;
  int currentIndex = 0;
  int maxPages = 0;

  MovieCarouselBloc({required this.getTrending, required this.movieBackdropBloc}) : super(MovieCarouselInitial()) {
    on<CarouselLoadEvent>((event, emit) async {
      emit(MovieCarouselLoading());
      allMovies.clear();
      currentIndex = 0;
      currentPage = 1;
      maxPages = 0;
      try {
        final movies = await getTrending(PageParam());

        currentIndex = event.currentIndex;

        if (movies.movies!.isEmpty) {
          emit(const MovieCarouselError('No movies found.'));
          return;
        }

        allMovies.addAll(movies.movies!);
        maxPages = movies.totalPages!;

        if (currentPage < maxPages) {
          emit(MovieCarouselLoaded(
            movies: allMovies,
            currentIndex: currentIndex,
            false,
          ));
        } else {
          emit(MovieCarouselLoaded(
            movies: allMovies,
            currentIndex: currentIndex,
            true,
          ));
        }
      } catch (e) {
        emit(const MovieCarouselError('There was an error.\nPlease try again later.'));
      }
    });
    on<CarouselFetchNextPage>((event, emit) async {
      currentPage++;
      if (currentPage > maxPages) return;
      try {
        final movies = await getTrending(PageParam(page: currentPage));
        allMovies.addAll(movies.movies!);
        emit(MovieCarouselLoading());
        if (currentPage < maxPages) {
          emit(MovieCarouselLoaded(
            movies: allMovies,
            currentIndex: currentIndex,
            false,
          ));
        } else {
          emit(MovieCarouselLoaded(
            movies: allMovies,
            currentIndex: currentIndex,
            true,
          ));
        }
      } catch (e) {
        emit(const MovieCarouselError('There was an error.\nPlease try again later.'));
      }
    });
  }
}
