import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/core/utils/helpers/connection_helper.dart';
import 'package:movie_bloc_app/features/movies/data/models/genre_model.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/no_params.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_genres.dart';

part 'genres_event.dart';
part 'genres_state.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  final GetGenres getGenres;

  GenresBloc({required this.getGenres}) : super(GenresInitial()) {
    on<GenresLoadEvent>((event, emit) async {
      await start();
      if (connectionStatus[0] == ConnectivityResult.none) {
        emit(const GenresError('No internet connection.'));
        return;
      }
      emit(GenresLoading());
      try {
        final genres = await getGenres(NoParams());

        if (genres.isEmpty) {
          emit(const GenresError('No genres found.'));
          return;
        }

        emit(GenresLoaded(genres: genres));
      } catch (e) {
        emit(const GenresError('There was an error.\nPlease try again later.'));
      }
    });
    on<GenresSelectEvent>((event, emit) {
      emit(GenresLoaded(genres: event.genres, selectedGenreIndex: event.selectedGenreIndex));
    });
  }
}
