import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/core/utils/helpers/connection_helper.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/params.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_movie_details.dart';

import '../../../data/models/movie_details_model.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails getMovieDetails;

  MovieDetailsBloc({required this.getMovieDetails}) : super(MovieDetailsInitial()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      if (!isConnected()) {
        emit(const MovieDetailsError('No internet connection.'));
        return;
      }
      emit(MovieDetailsLoading());
      try {
        final result = await getMovieDetails(Params(id: event.movieId));
        emit(MovieDetailsLoaded(result));
      } catch (e) {
        emit(const MovieDetailsError('Cannot load movie details.'));
        return;
      }
    });
  }
}
