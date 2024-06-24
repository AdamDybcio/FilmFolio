part of 'genres_bloc.dart';

sealed class GenresState extends Equatable {
  const GenresState();

  @override
  List<Object> get props => [];
}

final class GenresInitial extends GenresState {}

final class GenresLoading extends GenresState {}

final class GenresLoaded extends GenresState {
  final List<GenreModel> genres;
  final int selectedGenreIndex;

  const GenresLoaded({required this.genres, this.selectedGenreIndex = 0});

  @override
  List<Object> get props => [genres, selectedGenreIndex];
}

final class GenresError extends GenresState {
  final String message;

  const GenresError(this.message);

  @override
  List<Object> get props => [message];
}
