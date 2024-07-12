import 'package:flutter/material.dart';

import '../../../../movies/data/models/movie_model.dart';
import 'bookmark_card.dart';

class BookmarksSection extends StatelessWidget {
  const BookmarksSection({super.key, required this.bookmarks});

  final List<MovieModel> bookmarks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: GridView.count(
          childAspectRatio: 9 / 16,
          padding: const EdgeInsets.all(8),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          crossAxisCount: 2,
          children: [
            for (final bookmark in bookmarks) BookmarkCard(movie: bookmark),
          ],
        ),
      ),
    );
  }
}
