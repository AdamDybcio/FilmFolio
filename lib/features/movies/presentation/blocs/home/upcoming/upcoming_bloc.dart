import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/page_param.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_upcoming.dart';

import '../../../../data/models/movie_model.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  GetUpcoming getUpcoming;
  final List<MovieModel> allMovies = [];
  int currentPage = 1;
  int maxPages = 0;

  UpcomingBloc({required this.getUpcoming}) : super(UpcomingInitial()) {
    on<FetchUpcoming>((event, emit) async {
      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        emit(const UpcomingError('No internet connection.'));
        return;
      }

      emit(UpcomingLoading());
      allMovies.clear();
      currentPage = 1;
      maxPages = 0;
      try {
        final movies = await getUpcoming(PageParam());

        if (movies.movies!.isEmpty) {
          emit(const UpcomingError('No movies found.'));
          return;
        }

        allMovies.addAll(movies.movies!);
        maxPages = movies.totalPages!;
        if (allMovies.isEmpty) {
          emit(const UpcomingError('No movies found.'));
          return;
        }
        if (currentPage < maxPages) {
          emit(UpcomingSuccess(allMovies, false));
        } else {
          emit(UpcomingSuccess(allMovies, true));
        }
      } catch (e) {
        emit(const UpcomingError('An error occurred while loading movies.\nPlease try again.'));
      }
    });
    on<FetchUpcomingNextPage>((event, emit) async {
      currentPage++;
      if (currentPage > maxPages) return;
      try {
        final movies = await getUpcoming(PageParam(page: currentPage));
        allMovies.addAll(movies.movies!);
        emit(UpcomingLoading());
        if (currentPage < maxPages) {
          emit(UpcomingSuccess(allMovies, false));
        } else {
          emit(UpcomingSuccess(allMovies, true));
        }
      } catch (e) {
        emit(const UpcomingError('An error occurred while loading movies.\nPlease try again.'));
      }
    });
  }
}
