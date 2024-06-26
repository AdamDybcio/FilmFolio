import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_upcoming.dart';

import '../../../../data/models/movie_model.dart';
import '../../../../domain/entities/no_params.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  GetUpcoming getUpcoming;

  UpcomingBloc({required this.getUpcoming}) : super(UpcomingInitial()) {
    on<FetchUpcoming>((event, emit) async {
      emit(UpcomingLoading());
      try {
        final movies = await getUpcoming(NoParams());
        if (movies.isEmpty) {
          emit(const UpcomingError('No movies found.'));
          return;
        }
        emit(UpcomingSuccess(movies));
      } catch (e) {
        emit(const UpcomingError('An error occurred while loading movies.\nPlease try again.'));
      }
    });
  }
}
