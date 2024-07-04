import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomPlaceholder extends StatelessWidget {
  const CustomPlaceholder({
    super.key,
    required this.child,
    required this.width,
    required this.height,
    this.play = false,
  });

  final Widget child;
  final double width;
  final double height;
  final bool play;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Shimmer(
          enabled: play,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ],
          ),
          child: SizedBox(
            height: height,
            width: width,
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
