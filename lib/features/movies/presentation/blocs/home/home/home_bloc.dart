import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/features/movies/data/models/movies_result_model.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/page_param.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_genres.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_popular.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_upcoming.dart';

import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../data/models/genre_model.dart';
import '../../../../data/models/movie_model.dart';
import '../../../../domain/entities/no_params.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetGenres getGenres;
  final GetUpcoming getUpcoming;
  final GetPopular getPopular;

  //Popular
  List<MovieModel> popularMovies = [];

  //Upcoming
  List<MovieModel> upcomingMovies = [];

  //Genres
  List<GenreModel> genres = [];

  HomeBloc({
    required this.getGenres,
    required this.getPopular,
    required this.getUpcoming,
  }) : super(HomeInitial()) {
    on<LoadHome>((event, emit) async {
      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        emit(const HomeError('No internet connection'));
        return;
      }

      emit(HomeLoading());

      try {
        final trendingResult = await getPopular(PageParam());

        if (trendingResult.movies!.isEmpty) {
          emit(const HomeError('Error while fetching data'));
        } else {
          popularMovies = trendingResult.movies!;
        }

        final upcomingResult = await getUpcoming(PageParam());

        if (upcomingResult.movies!.isEmpty) {
          emit(const HomeError('Error while fetching data'));
        } else {
          upcomingMovies = upcomingResult.movies!;
        }

        final genresResult = await getGenres(NoParams());

        if (genresResult.isEmpty) {
          emit(const HomeError('Error while fetching data'));
        } else {
          genres = genresResult;
          emit(HomeLoaded(
            popularMovies: trendingResult,
            upcomingMovies: upcomingResult,
            genres: genresResult,
          ));
        }
      } catch (e) {
        emit(const HomeError('Error while fetching data'));
      }
    });
  }
}
