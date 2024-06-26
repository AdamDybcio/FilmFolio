import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/features/movies/data/models/genre_model.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_discover_movies.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/genres/genres_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/years/years_bloc.dart';

import '../../../../domain/entities/params.dart';

part 'discover_movies_list_event.dart';
part 'discover_movies_list_state.dart';

class DiscoverMoviesListBloc extends Bloc<DiscoverMoviesListEvent, DiscoverMoviesListState> {
  GetDiscoverMovies getDiscoverMovies;
  GenresBloc genresBloc;
  YearsBloc yearsBloc;

  DiscoverMoviesListBloc({required this.getDiscoverMovies, required this.genresBloc, required this.yearsBloc}) : super(DiscoverMoviesListInitial()) {
    on<DiscoverMoviesListLoadEvent>((event, emit) async {
      emit(DiscoverMoviesListLoading());
      int year = DateTime.now().year;
      GenreModel genre = const GenreModel(id: 28, name: 'Action');

      if (yearsBloc.state.props.isNotEmpty) {
        year = yearsBloc.state.props.first as int;
      }

      if (genresBloc.state.props.isNotEmpty) {
        List<GenreModel> genresList = genresBloc.state.props[0] as List<GenreModel>;
        genre = genresList[genresBloc.state.props[1] as int];
      }

      try {
        final movies = await getDiscoverMovies(Params(genre: genre, year: year));
        if (movies.isEmpty) {
          emit(const DiscoverMoviesListError('No movies found.'));
          return;
        }
        emit(DiscoverMoviesListLoaded(movies));
      } catch (e) {
        emit(const DiscoverMoviesListError('An error occurred while loading movies.\nPlease try again.'));
      }
    });
  }
}
