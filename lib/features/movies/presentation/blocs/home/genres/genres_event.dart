part of 'genres_bloc.dart';

sealed class GenresEvent extends Equatable {
  const GenresEvent();

  @override
  List<Object> get props => [];
}

final class FetchGenres extends GenresEvent {}

final class SelectGenre extends GenresEvent {
  final List<GenreModel> genres;
  final int selectedGenreIndex;

  const SelectGenre({required this.genres, required this.selectedGenreIndex});

  @override
  List<Object> get props => [genres, selectedGenreIndex];
}
