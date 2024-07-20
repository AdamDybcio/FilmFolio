import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../common/widgets/icons/background_icon.dart';
import '../../widgets/settings/author_widget.dart';
import '../../widgets/settings/settings_list.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundIcon(icon: FontAwesomeIcons.solidUser),
        AuthorWidget(),
        SettingsList(),
      ],
    );
  }
}
