import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_now_playing.dart';

import '../../../../domain/entities/no_params.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  GetNowPlaying getNowPlaying;

  NowPlayingBloc({required this.getNowPlaying}) : super(NowPlayingInitial()) {
    on<FetchNowPlaying>((event, emit) async {
      emit(NowPlayingLoading());
      try {
        final movies = await getNowPlaying(NoParams());
        if (movies.isEmpty) {
          emit(const NowPlayingError('No movies found.'));
          return;
        }
        emit(NowPlayingSuccess(movies));
      } catch (e) {
        emit(const NowPlayingError('An error occurred while loading movies.\nPlease try again.'));
      }
    });
  }
}
