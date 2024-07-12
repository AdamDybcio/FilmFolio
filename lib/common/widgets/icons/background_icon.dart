import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BackgroundIcon extends StatelessWidget {
  const BackgroundIcon({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 4),
          child: SizedBox(
            child: FittedBox(
              fit: BoxFit.cover,
              child: FaIcon(
                icon,
                size: MediaQuery.of(context).size.width / 2,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
