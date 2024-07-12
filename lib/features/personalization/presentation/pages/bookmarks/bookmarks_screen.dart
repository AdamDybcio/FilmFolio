import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_bloc_app/common/widgets/placeholders/error_placeholder.dart';
import 'package:movie_bloc_app/features/personalization/presentation/blocs/bloc/bookmarks_bloc.dart';

import '../../widgets/bookmarks/bookmarks_section.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder(
      bloc: context.read<BookmarksBloc>(),
      builder: (context, state) {
        if (state is BookmarksChanged) {
          if (state.bookmarks.isEmpty) {
            return Center(
              child: SizedBox(
                width: size.width,
                height: size.height * 0.55,
                child: FadeIn(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.bookmark,
                        size: 50,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(height: size.height * 0.05),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'You have no bookmarks yet.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          return BookmarksSection(
            bookmarks: state.bookmarks,
          );
        }
        return const Center(
          child: ErrorPlaceholder(message: 'There was and error. Please try again later.'),
        );
      },
    );
  }
}
