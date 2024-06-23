import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';

import '../../../core/utils/helpers/helper_functions.dart';

class CustomPlaceholder extends StatelessWidget {
  const CustomPlaceholder({
    super.key,
    required this.child,
    required this.width,
    required this.height,
  });

  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        color: darkMode ? AppColors.perfume : AppColors.blackHowl,
        borderRadius: BorderRadius.circular(10),
      ),
      height: height,
      width: width,
      child: Center(
        child: child,
      ),
    );
  }
}
