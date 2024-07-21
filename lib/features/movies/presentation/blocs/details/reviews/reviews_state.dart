part of 'reviews_bloc.dart';

sealed class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

final class ReviewsInitial extends ReviewsState {}

final class ReviewsLoading extends ReviewsState {}

final class ReviewsLoaded extends ReviewsState {
  final List<ReviewModel> reviews;
  final bool isMaxPage;

  const ReviewsLoaded(this.reviews, this.isMaxPage);

  @override
  List<Object> get props => [reviews];
}

final class ReviewsError extends ReviewsState {
  final String message;

  const ReviewsError(this.message);

  @override
  List<Object> get props => [message];
}
