part of 'all_movies_bloc.dart';

sealed class AllMoviesEvent extends Equatable {
  const AllMoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchAllMovies extends AllMoviesEvent {
  final String section;

  const FetchAllMovies(this.section);

  @override
  List<Object> get props => [section];
}

class LoadMoreAllMovies extends AllMoviesEvent {
  final String section;

  const LoadMoreAllMovies(this.section);

  @override
  List<Object> get props => [section];
}
