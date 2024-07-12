import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

import '../../../data/models/bookmarked_movie_hive.dart';

part 'bookmarks_event.dart';
part 'bookmarks_state.dart';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  List<MovieModel> bookmarks;

  BookmarksBloc({required this.bookmarks}) : super(const BookmarksInitial([])) {
    on<LoadBookmarks>((event, emit) async {
      emit(const BookmarksChanging());

      var box = Hive.box<BookmarkedMovie>('bookmarks');

      for (var element in box.values) {
        bookmarks.add(element.toMovieModel());
      }

      emit(BookmarksChanged(bookmarks));
    });
    on<AddBookmark>((event, emit) async {
      emit(const BookmarksChanging());

      var box = Hive.box<BookmarkedMovie>('bookmarks');

      box.add(event.movie.toBookmarkedMovie());
      bookmarks.add(event.movie);

      emit(BookmarksChanged(bookmarks));
    });
    on<RemoveBookmark>((event, emit) async {
      emit(const BookmarksChanging());

      var box = Hive.box<BookmarkedMovie>('bookmarks');

      for (var element in box.values) {
        if (element.id == event.movie.id) {
          box.delete(element.id);
          break;
        }
      }
      bookmarks.removeWhere((element) => element.id == event.movie.id);

      emit(BookmarksChanged(bookmarks));
    });
  }
}
