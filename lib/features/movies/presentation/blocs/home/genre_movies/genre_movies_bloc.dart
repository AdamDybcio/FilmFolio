import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/params/params.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_movies_by_genre.dart';

part 'genre_movies_event.dart';
part 'genre_movies_state.dart';

class GenreMoviesBloc extends Bloc<GenreMoviesEvent, GenreMoviesState> {
  final GetMoviesByGenre getMoviesByGenre;

  List<MovieModel> movies = [];
  int selectedYear = DateTime.now().year;
  bool isMaxPage = false;
  int currentPage = 1;
  int maxPages = 1;
  String genreId = '28';

  GenreMoviesBloc({required this.getMoviesByGenre}) : super(GenreMoviesInitial()) {
    on<FetchGenreMovies>((event, emit) async {
      movies.clear();
      currentPage = 1;
      maxPages = 1;
      isMaxPage = false;
      genreId = '28';

      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        emit(const GenreMoviesError('No internet connection'));
        return;
      }

      emit(GenreMoviesLoading());

      genreId = event.genreId;
      selectedYear = event.year;

      try {
        final genreMovies = await getMoviesByGenre(Params(
          genreId: genreId,
          page: currentPage,
          year: selectedYear,
        ));
        movies.addAll(genreMovies.movies!);
        maxPages = genreMovies.totalPages!;

        if (currentPage == maxPages) {
          isMaxPage = true;
        }

        emit(GenreMoviesLoaded(movies, isMaxPage, selectedYear));
      } catch (e) {
        emit(const GenreMoviesError('Error fetching movies'));
      }
    });

    on<FetchMoreGenreMovies>((event, emit) async {
      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        return;
      }

      currentPage++;

      if (currentPage == maxPages) {
        isMaxPage = true;
      }

      try {
        final genreMovies = await getMoviesByGenre(Params(
          genreId: genreId,
          page: currentPage,
          year: selectedYear,
        ));
        movies.addAll(genreMovies.movies!);
        maxPages = genreMovies.totalPages!;

        if (currentPage == maxPages) {
          isMaxPage = true;
        }

        emit(GenreMoviesLoading());
        emit(GenreMoviesLoaded(movies, isMaxPage, selectedYear));
      } catch (e) {
        emit(const GenreMoviesError('Error fetching movies'));
      }
    });
  }
}
