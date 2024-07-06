part of 'home_movies_bloc.dart';

sealed class HomeMoviesState extends Equatable {
  const HomeMoviesState();

  @override
  List<Object> get props => [];
}

final class HomeMoviesInitial extends HomeMoviesState {}

final class HomeMoviesLoading extends HomeMoviesState {}

final class HomeMoviesLoaded extends HomeMoviesState {}

final class HomeMoviesError extends HomeMoviesState {
  final String message;

  const HomeMoviesError(this.message);

  @override
  List<Object> get props => [message];
}
