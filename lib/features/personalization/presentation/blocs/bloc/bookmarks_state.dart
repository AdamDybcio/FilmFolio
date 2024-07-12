part of 'bookmarks_bloc.dart';

sealed class BookmarksState extends Equatable {
  const BookmarksState();

  @override
  List<Object> get props => [];
}

final class BookmarksInitial extends BookmarksState {
  final List<MovieModel> bookmarks;

  const BookmarksInitial(this.bookmarks);

  @override
  List<Object> get props => [bookmarks];
}

final class BookmarksChanging extends BookmarksState {
  const BookmarksChanging();
}

final class BookmarksChanged extends BookmarksState {
  final List<MovieModel> bookmarks;

  const BookmarksChanged(this.bookmarks);

  @override
  List<Object> get props => [bookmarks];
}
