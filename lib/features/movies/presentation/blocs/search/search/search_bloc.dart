import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_search_movies.dart';

import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../domain/entities/params/params.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchMovies getSearchMovies;
  TextEditingController controller;
  List<MovieModel> movies;

  int currentPage = 1;
  int maxPages = 1;

  bool isMaxPage = false;

  SearchBloc({required this.getSearchMovies, required this.controller, required this.movies}) : super(SearchInitial()) {
    on<SearchMovies>((event, emit) async {
      movies.clear();
      currentPage = 1;
      maxPages = 0;
      isMaxPage = false;
      final String initialValue = controller.text;

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
        final movieResult = await getSearchMovies(Params(query: event.query, page: currentPage));

        if (controller.text != initialValue) {
          return;
        }

        if (movieResult.movies!.isEmpty) {
          emit(SearchEmpty());
        } else {
          maxPages = movieResult.totalPages!;

          if (currentPage == maxPages) {
            isMaxPage = true;
          }

          movies.addAll(movieResult.movies!);
          emit(SearchLoaded(movies, isMaxPage));
        }
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });
    on<SearchLoadMore>((event, emit) async {
      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        return;
      }

      currentPage++;

      if (currentPage == maxPages) {
        isMaxPage = true;
      }

      try {
        final movieResult = await getSearchMovies(Params(query: controller.text, page: currentPage));
        currentPage++;

        if (currentPage == maxPages) {
          isMaxPage = true;
        }

        movies.addAll(movieResult.movies!);

        emit(SearchLoading());
        emit(SearchLoaded(movies, isMaxPage));
      } catch (e) {
        currentPage--;
        emit(SearchError(e.toString()));
      }
    });
  }
}
