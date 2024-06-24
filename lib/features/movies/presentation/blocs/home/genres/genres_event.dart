part of 'genres_bloc.dart';

sealed class GenresEvent extends Equatable {
  const GenresEvent();

  @override
  List<Object> get props => [];
}

final class GenresLoadEvent extends GenresEvent {}

final class GenresSelectEvent extends GenresEvent {
  final List<GenreModel> genres;
  final int selectedGenreIndex;

  const GenresSelectEvent({required this.genres, required this.selectedGenreIndex});

  @override
  List<Object> get props => [genres, selectedGenreIndex];
}
