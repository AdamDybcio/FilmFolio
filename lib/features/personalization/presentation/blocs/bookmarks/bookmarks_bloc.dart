import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

import '../../../data/models/bookmarked_movie_hive.dart';

part 'bookmarks_event.dart';
part 'bookmarks_state.dart';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  List<MovieModel> bookmarks;
  List<int> bookmarkIds;

  BookmarksBloc({required this.bookmarks, required this.bookmarkIds}) : super(BookmarksInitial(bookmarks, bookmarkIds)) {
    on<LoadBookmarks>((event, emit) {
      bookmarks.clear();
      bookmarkIds.clear();
      emit(const BookmarksChanging());

      var box = Hive.box<BookmarkedMovie>('bookmarks');

      for (var element in box.values) {
        bookmarks.add(element.toMovieModel());
        bookmarkIds.add(element.id);
      }

      emit(BookmarksChanged(bookmarks, bookmarkIds));
    });
    on<AddBookmark>((event, emit) {
      emit(const BookmarksChanging());

      var box = Hive.box<BookmarkedMovie>('bookmarks');

      box.add(event.movie.toBookmarkedMovie());
      bookmarks.add(event.movie);
      bookmarkIds.add(event.movie.id);

      emit(BookmarksChanged(bookmarks, bookmarkIds));
    });
    on<RemoveBookmark>((event, emit) {
      emit(const BookmarksChanging());

      var box = Hive.box<BookmarkedMovie>('bookmarks');

      List<int> keyList = [];
      List<BookmarkedMovie> valueList = [];
      int indexToRemove = -1;

      for (var key in box.keys) {
        keyList.add(key);
      }

      for (var element in box.values) {
        valueList.add(element);
      }

      for (int i = 0; i < valueList.length; i++) {
        if (valueList[i].id == event.movie.id) {
          indexToRemove = i;
          break;
        }
      }

      box.deleteAt(indexToRemove);
      bookmarks.removeWhere((element) => element.id == event.movie.id);
      bookmarkIds.removeWhere((key) => key == event.movie.id);

      emit(BookmarksChanged(bookmarks, bookmarkIds));
    });
    on<ClearBookmarks>((event, emit) {
      emit(const BookmarksChanging());

      var box = Hive.box<BookmarkedMovie>('bookmarks');

      box.clear();
      bookmarks.clear();
      bookmarkIds.clear();

      emit(BookmarksChanged(bookmarks, bookmarkIds));
    });
  }
}
