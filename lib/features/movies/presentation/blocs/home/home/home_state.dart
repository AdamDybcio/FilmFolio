part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final MoviesResultModel popularMovies;
  final MoviesResultModel upcomingMovies;
  final List<GenreModel> genres;
  final MoviesResultModel nowPlayingMovies;
  final MoviesResultModel topRatedMovies;
  final MoviesResultModel trendingMovies;

  const HomeLoaded({
    required this.upcomingMovies,
    required this.genres,
    required this.popularMovies,
    required this.nowPlayingMovies,
    required this.topRatedMovies,
    required this.trendingMovies,
  });

  @override
  List<Object> get props => [
        upcomingMovies,
        genres,
        popularMovies,
        nowPlayingMovies,
        topRatedMovies,
        trendingMovies,
      ];
}

final class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
