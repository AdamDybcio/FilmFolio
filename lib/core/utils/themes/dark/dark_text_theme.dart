import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';

class DarkTextTheme {
  static TextTheme get darkTextTheme {
    return TextTheme(
      titleLarge: TextStyle(fontSize: 90, fontWeight: FontWeight.bold, color: AppColors.diamondCut),
      titleMedium: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: AppColors.diamondCut),
      titleSmall: TextStyle(fontSize: 70, fontWeight: FontWeight.bold, color: AppColors.diamondCut),
      headlineLarge: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: AppColors.diamondCut),
      headlineMedium: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: AppColors.diamondCut),
      headlineSmall: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: AppColors.diamondCut),
      labelLarge: TextStyle(fontSize: 40, color: AppColors.diamondCut),
      labelMedium: TextStyle(fontSize: 35, color: AppColors.diamondCut),
      labelSmall: TextStyle(fontSize: 30, color: AppColors.diamondCut),
      bodyLarge: TextStyle(fontSize: 25, color: AppColors.diamondCut),
      bodyMedium: TextStyle(fontSize: 20, color: AppColors.diamondCut),
      bodySmall: TextStyle(fontSize: 18, color: AppColors.diamondCut),
      displayLarge: TextStyle(fontSize: 16, color: AppColors.diamondCut),
      displayMedium: TextStyle(fontSize: 14, color: AppColors.diamondCut),
      displaySmall: TextStyle(fontSize: 12, color: AppColors.diamondCut),
    );
  }
}
