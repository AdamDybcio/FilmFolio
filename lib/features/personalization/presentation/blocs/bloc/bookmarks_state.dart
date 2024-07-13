part of 'bookmarks_bloc.dart';

sealed class BookmarksState extends Equatable {
  const BookmarksState();

  @override
  List<Object> get props => [];
}

final class BookmarksInitial extends BookmarksState {
  final List<MovieModel> bookmarks;
  final List<int> bookmarkIds;

  const BookmarksInitial(this.bookmarks, this.bookmarkIds);

  @override
  List<Object> get props => [bookmarks, bookmarkIds];
}

final class BookmarksChanging extends BookmarksState {
  const BookmarksChanging();
}

final class BookmarksChanged extends BookmarksState {
  final List<MovieModel> bookmarks;
  final List<int> bookmarkIds;

  const BookmarksChanged(this.bookmarks, this.bookmarkIds);

  @override
  List<Object> get props => [bookmarks, bookmarkIds];
}
