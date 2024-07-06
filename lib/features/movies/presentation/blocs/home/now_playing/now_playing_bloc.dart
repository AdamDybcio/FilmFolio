import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/page_param.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_now_playing.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  GetNowPlaying getNowPlaying;
  final List<MovieModel> allMovies = [];
  int currentPage = 1;
  int maxPages = 0;

  NowPlayingBloc({required this.getNowPlaying}) : super(NowPlayingInitial()) {
    on<FetchNowPlaying>((event, emit) async {
      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        emit(const NowPlayingError('No internet connection.'));
        return;
      }

      emit(NowPlayingLoading());
      allMovies.clear();
      currentPage = 1;
      maxPages = 0;
      try {
        final movies = await getNowPlaying(PageParam());

        if (movies.movies!.isEmpty) {
          emit(const NowPlayingError('No movies found.'));
          return;
        }

        allMovies.addAll(movies.movies!);
        maxPages = movies.totalPages!;
        if (allMovies.isEmpty) {
          emit(const NowPlayingError('No movies found.'));
          return;
        }
        if (currentPage < maxPages) {
          emit(NowPlayingSuccess(allMovies, false));
        } else {
          emit(NowPlayingSuccess(allMovies, true));
        }
      } catch (e) {
        emit(const NowPlayingError('An error occurred while loading movies.\nPlease try again.'));
      }
    });
    on<FetchNowPlayingNextPage>((event, emit) async {
      currentPage++;
      if (currentPage > maxPages) return;
      try {
        final movies = await getNowPlaying(PageParam(page: currentPage));
        allMovies.addAll(movies.movies!);
        emit(NowPlayingLoading());
        if (currentPage < maxPages) {
          emit(NowPlayingSuccess(allMovies, false));
        } else {
          emit(NowPlayingSuccess(allMovies, true));
        }
      } catch (e) {
        emit(const NowPlayingError('An error occurred while loading movies.\nPlease try again.'));
      }
    });
  }
}
