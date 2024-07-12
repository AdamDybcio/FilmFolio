import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CenteredMessage extends StatelessWidget {
  const CenteredMessage({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FadeIn(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
            overflow: TextOverflow.clip,
          ),
        ),
      ),
    );
  }
}
