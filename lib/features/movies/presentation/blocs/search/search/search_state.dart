part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  final MoviesResultModel movies;

  const SearchLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}

final class SearchEmpty extends SearchState {}

final class SearchNoInternet extends SearchState {}
