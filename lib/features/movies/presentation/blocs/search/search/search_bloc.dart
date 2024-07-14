import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/params/search_param.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_search_movies.dart';

import '../../../../../../core/utils/helpers/helper_functions.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchMovies getSearchMovies;
  TextEditingController controller;
  List<MovieModel> movies;

  SearchBloc({required this.getSearchMovies, required this.controller, required this.movies}) : super(SearchInitial()) {
    on<SearchMovies>((event, emit) async {
      final String initialValue = controller.text;

      if (event.query.trim().isEmpty) {
        movies.clear();
        emit(SearchInitial());
        return;
      }
      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        movies.clear();
        emit(SearchNoInternet());
        return;
      }
      emit(SearchLoading());
      try {
        final movieResult = await getSearchMovies(SearchParam(query: event.query));

        if (controller.text != initialValue) {
          return;
        }

        if (movieResult.movies!.isEmpty) {
          emit(SearchEmpty());
        } else {
          movies.clear();
          movies.addAll(movieResult.movies!);
          emit(SearchLoaded(movies));
        }
      } catch (e) {
        movies.clear();
        emit(SearchError(e.toString()));
      }
    });
  }
}
