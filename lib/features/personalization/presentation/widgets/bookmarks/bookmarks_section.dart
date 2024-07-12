import 'package:flutter/widgets.dart';

import '../../../../movies/data/models/movie_model.dart';

class BookmarksSection extends StatelessWidget {
  const BookmarksSection({super.key, required this.bookmarks});

  final List<MovieModel> bookmarks;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
