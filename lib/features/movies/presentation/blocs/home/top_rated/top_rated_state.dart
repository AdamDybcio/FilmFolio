part of 'top_rated_bloc.dart';

sealed class TopRatedState extends Equatable {
  const TopRatedState();

  @override
  List<Object> get props => [];
}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedLoading extends TopRatedState {}

final class TopRatedSuccess extends TopRatedState {
  final List<MovieModel> movies;
  final bool hasReachedMax;

  const TopRatedSuccess(this.movies, this.hasReachedMax);

  @override
  List<Object> get props => [movies];
}

final class TopRatedError extends TopRatedState {
  final String message;

  const TopRatedError(this.message);

  @override
  List<Object> get props => [message];
}
