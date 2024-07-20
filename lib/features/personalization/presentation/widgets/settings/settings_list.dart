import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';

import '../../../../../core/utils/enums/enums.dart';
import '../../blocs/bookmarks/bookmarks_bloc.dart';
import '../../blocs/settings/settings_bloc.dart';
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
                  SettingTile(
                    title: 'Show Adult Content',
                    type: SettingsTileType.switchType,
                    onTapSwitch: (value) {
                      context.read<SettingsBloc>().add(ChangeSettings(includeAdult: value));
                      HelperFunctions.showSnackBar(context, 'From now, adult content will be ${value ? 'shown' : 'hidden'}');
                    },
                  ),
                  BlocBuilder(
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
                  ),
                  const SettingTile(title: 'Change Language', type: SettingsTileType.buttonType),
                  const SettingTile(title: 'Set Dark/Light/Auto Mode', type: SettingsTileType.toggleButtonsType),
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
