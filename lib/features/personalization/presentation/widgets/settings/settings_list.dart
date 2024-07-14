import 'package:flutter/material.dart';

import 'setting_tile.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SettingTile(title: 'Show Adult Content', isSwitch: true),
            SettingTile(title: 'Clear All Bookmarks', isButton: true, buttonTitle: 'Clear'),
            SettingTile(title: 'Change Locale', isButton: true),
            SettingTile(title: 'Set Dark/Light/Auto Mode', isToggleButtons: true),
            SettingTile(title: 'Set Your API KEY', isButton: true),
          ],
        ),
      ),
    );
  }
}
