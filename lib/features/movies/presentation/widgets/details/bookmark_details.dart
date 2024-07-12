import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:movie_bloc_app/features/personalization/presentation/blocs/bloc/bookmarks_bloc.dart';

class BookmarkDetails extends StatelessWidget {
  const BookmarkDetails({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    bool isBookmarked = false;

    return BlocBuilder(
      bloc: context.read<BookmarksBloc>(),
      builder: (context, state) {
        if (state is BookmarksChanged) {
          isBookmarked = state.bookmarks.contains(movie);

          return Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(75),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.secondary,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (isBookmarked) {
                          context.read<BookmarksBloc>().add(RemoveBookmark(movie));
                          isBookmarked = context.read<BookmarksBloc>().bookmarks.contains(movie);
                          HelperFunctions.showSnackBar(context, 'Removed from bookmarks');
                        } else {
                          context.read<BookmarksBloc>().add(AddBookmark(movie));
                          isBookmarked = context.read<BookmarksBloc>().bookmarks.contains(movie);
                          HelperFunctions.showSnackBar(context, 'Added to bookmarks');
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
