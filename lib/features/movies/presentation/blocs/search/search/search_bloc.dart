import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/features/movies/data/models/movies_result_model.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/search_param.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_search_movies.dart';

import '../../../../../../core/utils/helpers/helper_functions.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchMovies getSearchMovies;

  SearchBloc({required this.getSearchMovies}) : super(SearchInitial()) {
    on<SearchMovies>((event, emit) async {
      if (event.query.trim().isEmpty) {
        emit(SearchInitial());
        return;
      }
      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        emit(SearchNoInternet());
        return;
      }
      emit(SearchLoading());
      try {
        final movies = await getSearchMovies(SearchParam(query: event.query));
        if (movies.movies!.isEmpty) {
          emit(SearchEmpty());
        } else {
          emit(SearchLoaded(movies));
        }
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });
  }
}
