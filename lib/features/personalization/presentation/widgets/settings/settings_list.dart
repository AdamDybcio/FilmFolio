import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/features/personalization/presentation/widgets/settings/adult_content_tile.dart';
import 'package:movie_bloc_app/features/personalization/presentation/widgets/settings/theme_mode_tile.dart';

import '../../../../../core/utils/enums/enums.dart';
import '../../blocs/settings/settings_bloc.dart';
import 'clear_bookmarks_tile.dart';
import 'setting_tile.dart';

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
              child: Column(
                children: [
                  const AdultContentTile(),
                  const ClearBookmarksTile(),
                  const SettingTile(
                    title: 'Change Language',
                    type: SettingsTileType.buttonType,
                    onTapButton: null,
                  ),
                  const ThemeModeTile(),
                  const SettingTile(title: 'Set Your API KEY', type: SettingsTileType.buttonType),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.error,
                        ),
                        child: Text(
                          'Reset All Settings',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ),
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
