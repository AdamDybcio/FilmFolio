import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/core/utils/enums/enums.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/features/personalization/presentation/blocs/settings/settings_bloc.dart';
import 'package:movie_bloc_app/features/personalization/presentation/widgets/settings/setting_tile.dart';

class AdultContentTile extends StatelessWidget {
  const AdultContentTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      title: 'Show Adult Content',
      type: SettingsTileType.switchType,
      onTapSwitch: (value) {
        context.read<SettingsBloc>().add(ChangeSettings(includeAdult: value));
        HelperFunctions.showSnackBar(context, 'From now, adult content will be ${value ? 'shown' : 'hidden'}');
      },
    );
  }
}
