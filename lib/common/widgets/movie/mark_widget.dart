import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';

import '../../../core/utils/helpers/helper_functions.dart';
import '../../../features/personalization/presentation/blocs/bloc/bookmarks_bloc.dart';

class MarkWidget extends StatelessWidget {
  const MarkWidget({
    super.key,
    required this.movie,
    this.width = 45,
    this.height = 45,
    this.hasShadow = false,
  });

  final MovieModel movie;
  final double width;
  final double height;
  final bool hasShadow;

  @override
  Widget build(BuildContext context) {
    bool isBookmarked = false;

    return BlocBuilder(
      bloc: context.read<BookmarksBloc>(),
      builder: (context, state) {
        if (state is BookmarksChanged) {
          isBookmarked = state.bookmarks.contains(movie);

          return Align(
            alignment: Alignment.topRight,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
                boxShadow: hasShadow ? Styles(context: context).containerShadows : null,
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: IconButton(
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
                  icon: FaIcon(
                    FontAwesomeIcons.solidBookmark,
                    color: Colors.yellow,
                    size: 30,
                    shadows: Styles(context: context).iconShadows,
                  ),
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
