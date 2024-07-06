part of 'discover_movies_bloc.dart';

sealed class DiscoverMoviesEvent extends Equatable {
  const DiscoverMoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchDiscoverMovies extends DiscoverMoviesEvent {
  const FetchDiscoverMovies({this.page = 1});

  final int page;

  @override
  List<Object> get props => [];
}

class FetchNextPageDiscoverMovies extends DiscoverMoviesEvent {}
