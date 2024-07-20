import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/core/utils/enums/enums.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/features/personalization/presentation/widgets/settings/setting_tile.dart';

import '../../blocs/bookmarks/bookmarks_bloc.dart';

class ClearBookmarksTile extends StatelessWidget {
  const ClearBookmarksTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<BookmarksBloc>(),
      builder: (context, state) {
        if (state is BookmarksChanged) {
          return SettingTile(
            title: 'Clear All Bookmarks',
            type: SettingsTileType.buttonType,
            buttonTitle: 'Clear',
            onTapButton: state.bookmarks.isNotEmpty
                ? () {
                    context.read<BookmarksBloc>().add(ClearBookmarks());
                    HelperFunctions.showSnackBar(context, 'All bookmarks have been cleared');
                  }
                : null,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
