part of 'discover_movies_list_bloc.dart';

sealed class DiscoverMoviesListState extends Equatable {
  const DiscoverMoviesListState();

  @override
  List<Object> get props => [];
}

final class DiscoverMoviesListInitial extends DiscoverMoviesListState {}

final class DiscoverMoviesListLoading extends DiscoverMoviesListState {}

final class DiscoverMoviesListLoaded extends DiscoverMoviesListState {
  final List<MovieModel> movies;

  const DiscoverMoviesListLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class DiscoverMoviesListError extends DiscoverMoviesListState {
  final String message;

  const DiscoverMoviesListError(this.message);

  @override
  List<Object> get props => [message];
}

final class DiscoverMoviesListEmpty extends DiscoverMoviesListState {}
