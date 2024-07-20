import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/features/personalization/presentation/widgets/settings/adult_content_tile.dart';
import 'package:movie_bloc_app/features/personalization/presentation/widgets/settings/theme_mode_tile.dart';

import '../../blocs/settings/settings_bloc.dart';
import 'change_language_tile.dart';
import 'clear_bookmarks_tile.dart';
import 'set_api_key_tile.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<SettingsBloc>(),
      builder: (context, state) {
        if (state is SettingsChanged) {
          return SafeArea(
            child: FadeIn(
              child: const Column(
                children: [
                  AdultContentTile(),
                  ClearBookmarksTile(),
                  ChangeLanguageTile(),
                  ThemeModeTile(),
                  SetApiKeyTile(),
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
