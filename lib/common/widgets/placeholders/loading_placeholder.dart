import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'custom_placeholder.dart';

class LoadingPlaceholder extends StatelessWidget {
  const LoadingPlaceholder({
    super.key,
    this.height = 0.55,
    this.width = 1,
    this.isSpecialHeight = false,
    this.child,
  });

  final double height;
  final double width;
  final bool isSpecialHeight;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomPlaceholder(
      height: !isSpecialHeight ? size.height * height : height,
      width: size.width * width,
      play: true,
      child: child == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LoadingAnimationWidget.beat(color: Theme.of(context).colorScheme.primary, size: 50),
                SizedBox(height: size.height * 0.05),
                Text('Loading...', style: Theme.of(context).textTheme.headlineSmall),
              ],
            )
          : child!,
    );
  }
}
