part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final MoviesResultModel popularMovies;
  final MoviesResultModel upcomingMovies;
  final List<GenreModel> genres;

  const HomeLoaded({
    required this.upcomingMovies,
    required this.genres,
    required this.popularMovies,
  });

  @override
  List<Object> get props => [upcomingMovies, genres, popularMovies];
}

final class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
