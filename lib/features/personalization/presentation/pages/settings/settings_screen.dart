import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../common/widgets/icons/background_icon.dart';
import '../../widgets/settings/settings_list.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundIcon(icon: FontAwesomeIcons.solidUser),
        const SettingsList(),
        Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 30,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Center(
                    child: Text(
                      'Version 1.0.0 | © 2024 | All Rights Reserved | Adam Dybcio',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.25),
                      ),
                    ),
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
