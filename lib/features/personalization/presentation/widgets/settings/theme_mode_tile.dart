import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/core/utils/enums/enums.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/features/personalization/presentation/blocs/settings/settings_bloc.dart';
import 'package:movie_bloc_app/features/personalization/presentation/widgets/settings/setting_tile.dart';

class ThemeModeTile extends StatelessWidget {
  const ThemeModeTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      title: 'Set Theme Mode',
      type: SettingsTileType.toggleButtonsType,
      onTapToggleButtons: (index) {
        if (index == 0) {
          context.read<SettingsBloc>().add(const ChangeSettings(themeMode: 'light'));
          AdaptiveTheme.of(context).setLight();
          HelperFunctions.showSnackBar(context, 'Theme mode set to Light');
        } else if (index == 1) {
          context.read<SettingsBloc>().add(const ChangeSettings(themeMode: 'dark'));
          AdaptiveTheme.of(context).setDark();
          HelperFunctions.showSnackBar(context, 'Theme mode set to Dark');
        } else {
          context.read<SettingsBloc>().add(const ChangeSettings(themeMode: 'auto'));
          AdaptiveTheme.of(context).setSystem();
          HelperFunctions.showSnackBar(context, 'Theme mode set to Auto');
        }
      },
    );
  }
}
