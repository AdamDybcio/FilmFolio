import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/no_params.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_top_rated.dart';

import '../../../../data/models/movie_model.dart';

part 'top_rated_event.dart';
part 'top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  GetTopRated getTopRated;

  TopRatedBloc({required this.getTopRated}) : super(TopRatedInitial()) {
    on<FetchTopRated>((event, emit) async {
      emit(TopRatedLoading());
      try {
        final movies = await getTopRated(NoParams());
        if (movies.isEmpty) {
          emit(const TopRatedError('No movies found.'));
          return;
        }
        emit(TopRatedSuccess(movies));
      } catch (e) {
        emit(const TopRatedError('An error occurred while loading movies.\nPlease try again.'));
      }
    });
  }
}
