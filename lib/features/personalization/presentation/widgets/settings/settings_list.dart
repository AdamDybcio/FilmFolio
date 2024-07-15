import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'setting_tile.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FadeIn(
        child: const Column(
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
