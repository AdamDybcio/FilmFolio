part of 'trending_bloc.dart';

abstract class TrendingState extends Equatable {
  const TrendingState();

  @override
  List<Object> get props => [];
}

final class TrendingInitial extends TrendingState {}

final class TrendingLoading extends TrendingState {}

final class TrendingError extends TrendingState {
  final String message;

  const TrendingError(this.message);

  @override
  List<Object> get props => [message];
}

final class TrendingLoaded extends TrendingState {
  final List<MovieModel> movies;
  final int currentIndex;
  final bool hasReachedMax;

  const TrendingLoaded(this.hasReachedMax, {required this.movies, this.currentIndex = 0});

  @override
  List<Object> get props => [movies, currentIndex];
}
