part of 'all_movies_bloc.dart';

sealed class AllMoviesState extends Equatable {
  const AllMoviesState();

  @override
  List<Object> get props => [];
}

final class AllMoviesInitial extends AllMoviesState {}

final class AllMoviesLoading extends AllMoviesState {}

final class AllMoviesLoaded extends AllMoviesState {
  final List<MovieModel> movies;
  final bool isMaxPage;

  const AllMoviesLoaded({
    required this.movies,
    required this.isMaxPage,
  });

  @override
  List<Object> get props => [movies, isMaxPage];
}

final class AllMoviesError extends AllMoviesState {
  final String message;

  const AllMoviesError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
