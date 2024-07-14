import 'package:flutter/material.dart';

import '../../../../../common/styles/styles.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    this.onTapSwitch,
    this.isSwitch = false,
    this.onTapButton,
    this.buttonTitle = 'Edit',
    this.isButton = false,
    this.isToggleButtons = false,
    this.onTapToggleButtons,
  });

  final String title;
  final Function(bool)? onTapSwitch;
  final bool isSwitch;
  final bool isButton;
  final bool isToggleButtons;
  final VoidCallback? onTapButton;
  final String buttonTitle;
  final Function(int)? onTapToggleButtons;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.1,
        decoration: Styles(context: context).cardBoxDecoration.copyWith(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: isSwitch
                  ? Switch(
                      value: false,
                      onChanged: onTapSwitch,
                      activeColor: Theme.of(context).colorScheme.secondary,
                    )
                  : isButton
                      ? ElevatedButton(
                          onPressed: onTapButton,
                          child: Text(buttonTitle),
                        )
                      : isToggleButtons
                          ? ToggleButtons(
                              isSelected: const [true, false, false],
                              onPressed: onTapToggleButtons,
                              children: const [
                                Padding(padding: EdgeInsets.all(3), child: Text('Light')),
                                Padding(padding: EdgeInsets.all(3), child: Text('Dark')),
                                Padding(padding: EdgeInsets.all(3), child: Text('Auto')),
                              ],
                            )
                          : null,
            ),
          ],
        ),
      ),
    );
  }
}
