part of 'upcoming_bloc.dart';

sealed class UpcomingState extends Equatable {
  const UpcomingState();

  @override
  List<Object> get props => [];
}

final class UpcomingInitial extends UpcomingState {}

final class UpcomingLoading extends UpcomingState {}

final class UpcomingSuccess extends UpcomingState {
  final List<MovieModel> movies;

  const UpcomingSuccess(this.movies);

  @override
  List<Object> get props => [movies];
}

final class UpcomingError extends UpcomingState {
  final String message;

  const UpcomingError(this.message);

  @override
  List<Object> get props => [message];
}
