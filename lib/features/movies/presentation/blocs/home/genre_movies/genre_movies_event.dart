part of 'genre_movies_bloc.dart';

sealed class GenreMoviesEvent extends Equatable {
  const GenreMoviesEvent();

  @override
  List<Object> get props => [];
}

final class FetchGenreMovies extends GenreMoviesEvent {
  final String genreId;
  final int year;

  const FetchGenreMovies(this.genreId, this.year);

  @override
  List<Object> get props => [genreId, year];
}

final class FetchMoreGenreMovies extends GenreMoviesEvent {}
