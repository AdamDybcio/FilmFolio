import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/utils/enums/enums.dart';

import 'setting_tile.dart';

class ChangeLanguageTile extends StatelessWidget {
  const ChangeLanguageTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SettingTile(
      title: 'Change Language',
      type: SettingsTileType.buttonType,
      onTapButton: null,
    );
  }
}
