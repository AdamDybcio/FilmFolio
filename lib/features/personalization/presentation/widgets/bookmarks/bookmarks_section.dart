import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/features/personalization/presentation/blocs/settings/settings_bloc.dart';

import '../../../../movies/data/models/movie_model.dart';
import 'bookmark_card.dart';

class BookmarksSection extends StatelessWidget {
  const BookmarksSection({super.key, required this.bookmarks});

  final List<MovieModel> bookmarks;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is SettingsChanged) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: GridView.count(
                childAspectRatio: 9 / 16,
                padding: const EdgeInsets.all(8),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount: 3,
                children: [
                  if (state.showAdultContent)
                    for (final bookmark in bookmarks) BookmarkCard(movie: bookmark),
                  if (!state.showAdultContent)
                    for (final bookmark in bookmarks)
                      if (!bookmark.adult) BookmarkCard(movie: bookmark),
                ],
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
