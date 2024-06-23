import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/no_params.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_trending.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../backdrop/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc({required this.getTrending, required this.movieBackdropBloc}) : super(MovieCarouselInitial()) {
    on<CarouselLoadEvent>((event, emit) async {
      emit(MovieCarouselLoading());
      try {
        final movies = await getTrending(NoParams());
        emit(MovieCarouselLoaded(
          movies: movies,
          currentIndex: event.currentIndex,
        ));
      } catch (e) {
        emit(const MovieCarouselError('There was an error.\nPlease try again later.'));
      }
    });
  }
}
