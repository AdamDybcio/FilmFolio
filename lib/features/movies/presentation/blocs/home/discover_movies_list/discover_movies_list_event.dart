part of 'discover_movies_list_bloc.dart';

sealed class DiscoverMoviesListEvent extends Equatable {
  const DiscoverMoviesListEvent();

  @override
  List<Object> get props => [];
}

class DiscoverMoviesListLoadEvent extends DiscoverMoviesListEvent {
  const DiscoverMoviesListLoadEvent({required this.page});

  final int page;

  @override
  List<Object> get props => [];
}

class DiscoverMoviesListFetchNextPage extends DiscoverMoviesListEvent {}
