import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/features/movies/domain/entities/params/params.dart';
import 'package:movie_bloc_app/features/movies/domain/usecases/get_movie_reviews.dart';

import '../../../../data/models/review_model.dart';

part 'reviews_event.dart';
part 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final GetMovieReviews getMovieReviews;

  List<ReviewModel> reviews = [];
  int currentPage = 1;
  int maxPages = 1;

  bool isMaxPage = false;

  int movieId = 0;

  ReviewsBloc({required this.getMovieReviews}) : super(ReviewsInitial()) {
    on<ReviewsFetch>((event, emit) async {
      reviews.clear();
      currentPage = 1;
      maxPages = 1;
      isMaxPage = false;
      movieId = 0;

      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        emit(const ReviewsError('No internet connection'));
        return;
      }

      emit(ReviewsLoading());

      movieId = event.movieId;

      try {
        final movieReviews = await getMovieReviews(Params(page: currentPage, id: movieId));
        reviews.addAll(movieReviews.reviews);
        maxPages = movieReviews.totalPages;

        if (reviews.isEmpty) {
          emit(const ReviewsError('No reviews found'));
          return;
        }

        if (currentPage == maxPages) {
          isMaxPage = true;
        }

        emit(ReviewsLoaded(reviews, isMaxPage));
      } catch (e) {
        emit(const ReviewsError('An error occurred'));
      }
    });
    on<ReviewsLoadMore>((event, emit) async {
      final hasConnection = await HelperFunctions.hasConnection();
      if (!hasConnection) {
        return;
      }

      currentPage++;

      if (currentPage == maxPages) {
        isMaxPage = true;
      }

      try {
        final movieReviews = await getMovieReviews(Params(page: currentPage, id: movieId));
        reviews.addAll(movieReviews.reviews);
        maxPages = movieReviews.totalPages;

        emit(ReviewsLoading());
        emit(ReviewsLoaded(reviews, isMaxPage));
      } catch (e) {
        currentPage--;
        emit(const ReviewsError('An error occurred'));
      }
    });
  }
}
