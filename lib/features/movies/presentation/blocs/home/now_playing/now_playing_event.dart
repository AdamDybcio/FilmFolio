part of 'now_playing_bloc.dart';

sealed class NowPlayingEvent extends Equatable {
  const NowPlayingEvent();

  @override
  List<Object> get props => [];
}

class FetchNowPlaying extends NowPlayingEvent {}

class FetchNowPlayingNextPage extends NowPlayingEvent {}
