import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_bloc_app/features/personalization/presentation/blocs/bloc/bookmarks_bloc.dart';

import '../../../../../common/widgets/icons/background_icon.dart';
import '../../../../../common/widgets/texts/centered_message.dart';
import '../../widgets/bookmarks/bookmarks_section.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundIcon(icon: FontAwesomeIcons.bookmark),
        BlocBuilder(
          bloc: context.read<BookmarksBloc>(),
          builder: (context, state) {
            if (state is BookmarksChanged) {
              if (state.bookmarks.isEmpty) {
                return const CenteredMessage(message: 'You have no bookmarks yet');
              }
              return BookmarksSection(
                bookmarks: state.bookmarks.reversed.toList(),
              );
            }
            return const CenteredMessage(message: 'Error');
          },
        ),
      ],
    );
  }
}
