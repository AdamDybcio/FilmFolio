import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.isVertical = false});

  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (isVertical) {
      return VerticalDivider(
        color: Theme.of(context).colorScheme.primary,
        thickness: 2,
        width: size.width * 0.05,
      );
    } else {
      return Divider(
        color: Theme.of(context).colorScheme.primary,
        thickness: 2,
        height: size.height * 0.05,
      );
    }
  }
}
