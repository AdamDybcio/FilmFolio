part of 'genre_movies_bloc.dart';

sealed class GenreMoviesState extends Equatable {
  const GenreMoviesState();

  @override
  List<Object> get props => [];
}

final class GenreMoviesInitial extends GenreMoviesState {}

final class GenreMoviesLoading extends GenreMoviesState {}

final class GenreMoviesLoaded extends GenreMoviesState {
  final List<MovieModel> movies;
  final bool isMaxPage;
  final int selectedYear;

  const GenreMoviesLoaded(this.movies, this.isMaxPage, this.selectedYear);

  @override
  List<Object> get props => [movies, isMaxPage, selectedYear];
}

final class GenreMoviesError extends GenreMoviesState {
  final String message;

  const GenreMoviesError(this.message);

  @override
  List<Object> get props => [message];
}
