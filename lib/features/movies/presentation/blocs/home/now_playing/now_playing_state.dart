part of 'now_playing_bloc.dart';

sealed class NowPlayingState extends Equatable {
  const NowPlayingState();

  @override
  List<Object> get props => [];
}

final class NowPlayingInitial extends NowPlayingState {}

final class NowPlayingLoading extends NowPlayingState {}

final class NowPlayingSuccess extends NowPlayingState {
  final List<MovieModel> movies;
  final bool hasReachedMax;

  const NowPlayingSuccess(this.movies, this.hasReachedMax);

  @override
  List<Object> get props => [movies];
}

final class NowPlayingError extends NowPlayingState {
  final String message;

  const NowPlayingError(this.message);

  @override
  List<Object> get props => [message];
}
