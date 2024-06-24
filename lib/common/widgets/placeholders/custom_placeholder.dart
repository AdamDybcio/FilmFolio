import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/helpers/helper_functions.dart';

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
    final darkMode = HelperFunctions.isDarkMode(context);
    return SizedBox(
      height: height,
      width: width,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Shimmer(
          enabled: play,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: darkMode
                ? [
                    AppColors.coolFrost,
                    AppColors.magicWhale,
                    AppColors.coolFrost,
                  ]
                : [
                    AppColors.magicWhale,
                    AppColors.coolFrost,
                    AppColors.magicWhale,
                  ],
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: darkMode ? AppColors.coolFrost : AppColors.magicWhale,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
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
