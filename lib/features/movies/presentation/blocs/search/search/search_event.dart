part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

final class SearchMovies extends SearchEvent {
  final String query;

  const SearchMovies(this.query);

  @override
  List<Object> get props => [query];
}
