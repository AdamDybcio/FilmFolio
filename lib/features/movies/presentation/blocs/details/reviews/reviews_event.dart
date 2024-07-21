part of 'reviews_bloc.dart';

sealed class ReviewsEvent extends Equatable {
  const ReviewsEvent();

  @override
  List<Object> get props => [];
}

final class ReviewsFetch extends ReviewsEvent {
  final int movieId;

  const ReviewsFetch(this.movieId);

  @override
  List<Object> get props => [movieId];
}

final class ReviewsLoadMore extends ReviewsEvent {}
