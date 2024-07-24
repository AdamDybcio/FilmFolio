import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_details_model.dart';
import 'package:movie_bloc_app/features/movies/data/models/movies_result_model.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_similar.dart';

import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../domain/entities/params/params.dart';
import '../../../../domain/usecases/get_movie_details.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final GetMovieDetails getMovieDetails;
  final GetSimilar getSimilar;

  int movieId = 0;

  late MovieDetailsModel movieDetails;
  late MoviesResultModel similarMovies;
  int currentPage = 1;
  int maxPages = 1;
  bool isMaxPage = false;

  DetailsBloc({required this.getMovieDetails, required this.getSimilar}) : super(DetailsInitial()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      similarMovies = MoviesResultModel.empty();
      currentPage = 1;
      maxPages = 1;
      movieDetails = MovieDetailsModel.empty();
      isMaxPage = false;
      movieId = event.movieId;
      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        emit(const DetailsError('No internet connection.'));
        return;
      }

      emit(DetailsLoading());

      try {
        final result = await getMovieDetails(Params(id: movieId));
        final similar = await getSimilar(Params(id: movieId, page: currentPage));

        movieDetails = result;

        if (similar.movies!.isEmpty) {
          emit(DetailsLoaded(result, similar, true));
          return;
        }

        similarMovies.movies!.addAll(similar.movies!);

        maxPages = similar.totalPages!;

        if (currentPage == maxPages) {
          isMaxPage = true;
        }

        emit(DetailsLoaded(movieDetails, similarMovies, isMaxPage));
      } catch (e) {
        emit(const DetailsError('Cannot load movie details.'));
        return;
      }
    });
    on<LoadMoreSimilar>((event, emit) async {
      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        return;
      }

      currentPage++;

      if (currentPage == maxPages) {
        isMaxPage = true;
      }

      try {
        final similar = await getSimilar(Params(id: movieId, page: currentPage));

        similarMovies.movies!.addAll(similar.movies!);

        if (currentPage == maxPages) {
          isMaxPage = true;
        }

        emit(DetailsLoading());
        emit(DetailsLoaded(movieDetails, similarMovies, isMaxPage));
      } catch (e) {
        currentPage--;
        emit(const DetailsError('Cannot load movie details.'));
        return;
      }
    });
  }
}
