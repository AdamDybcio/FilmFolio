part of 'bookmarks_bloc.dart';

sealed class BookmarksEvent extends Equatable {
  const BookmarksEvent();

  @override
  List<Object> get props => [];
}

final class LoadBookmarks extends BookmarksEvent {}

final class AddBookmark extends BookmarksEvent {
  final MovieModel movie;

  const AddBookmark(this.movie);

  @override
  List<Object> get props => [movie];
}

final class RemoveBookmark extends BookmarksEvent {
  final MovieModel movie;

  const RemoveBookmark(this.movie);

  @override
  List<Object> get props => [movie];
}

final class ClearBookmarks extends BookmarksEvent {}
