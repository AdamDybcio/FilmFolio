import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_placeholder.dart';

class ErrorPlaceholder extends StatelessWidget {
  const ErrorPlaceholder({
    super.key,
    this.height = 0.55,
    this.width = 1,
    this.isSpecialHeight = false,
    this.child,
    required this.message,
  });

  final double height;
  final double width;
  final bool isSpecialHeight;
  final Widget? child;
  final String message;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomPlaceholder(
      height: !isSpecialHeight ? size.height * height : height,
      width: size.width * width,
      child: FadeIn(
        child: child == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FaIcon(FontAwesomeIcons.solidFaceSadTear, size: 50),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.clip,
                  ),
                ],
              )
            : child!,
      ),
    );
  }
}
