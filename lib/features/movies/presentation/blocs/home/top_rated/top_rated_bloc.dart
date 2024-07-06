import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';

import 'package:movie_bloc_app/features/movies/domain/entities/page_param.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_top_rated.dart';

import '../../../../data/models/movie_model.dart';

part 'top_rated_event.dart';
part 'top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  GetTopRated getTopRated;
  final List<MovieModel> allMovies = [];
  int currentPage = 1;
  int maxPages = 0;

  TopRatedBloc({required this.getTopRated}) : super(TopRatedInitial()) {
    on<FetchTopRated>((event, emit) async {
      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        emit(const TopRatedError('No internet connection.'));
        return;
      }

      emit(TopRatedLoading());
      allMovies.clear();
      currentPage = 1;
      maxPages = 0;
      try {
        final movies = await getTopRated(PageParam());

        if (movies.movies!.isEmpty) {
          emit(const TopRatedError('No movies found.'));
          return;
        }

        allMovies.addAll(movies.movies!);
        maxPages = movies.totalPages!;
        if (allMovies.isEmpty) {
          emit(const TopRatedError('No movies found.'));
          return;
        }
        if (currentPage < maxPages) {
          emit(TopRatedSuccess(allMovies, false));
        } else {
          emit(TopRatedSuccess(allMovies, true));
        }
      } catch (e) {
        emit(const TopRatedError('An error occurred while loading movies.\nPlease try again.'));
      }
    });
    on<FetchTopRatedNextPage>((event, emit) async {
      currentPage++;
      if (currentPage > maxPages) return;
      try {
        final movies = await getTopRated(PageParam(page: currentPage));
        allMovies.addAll(movies.movies!);
        emit(TopRatedLoading());
        if (currentPage < maxPages) {
          emit(TopRatedSuccess(allMovies, false));
        } else {
          emit(TopRatedSuccess(allMovies, true));
        }
      } catch (e) {
        emit(const TopRatedError('An error occurred while loading movies.\nPlease try again.'));
      }
    });
  }
}
