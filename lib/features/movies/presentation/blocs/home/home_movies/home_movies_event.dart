part of 'home_movies_bloc.dart';

sealed class HomeMoviesEvent extends Equatable {
  const HomeMoviesEvent();

  @override
  List<Object> get props => [];
}

class LoadHomeMovies extends HomeMoviesEvent {}
