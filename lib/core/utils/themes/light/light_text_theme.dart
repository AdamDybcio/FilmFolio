import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';

class LightTextTheme {
  static TextTheme get lightTextTheme {
    return TextTheme(
      titleLarge: TextStyle(fontSize: 90, fontWeight: FontWeight.bold, color: AppColors.blackHowl),
      titleMedium: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: AppColors.blackHowl),
      titleSmall: TextStyle(fontSize: 70, fontWeight: FontWeight.bold, color: AppColors.blackHowl),
      headlineLarge: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: AppColors.blackHowl),
      headlineMedium: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: AppColors.blackHowl),
      headlineSmall: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: AppColors.blackHowl),
      labelLarge: TextStyle(fontSize: 40, color: AppColors.blackHowl),
      labelMedium: TextStyle(fontSize: 35, color: AppColors.blackHowl),
      labelSmall: TextStyle(fontSize: 30, color: AppColors.blackHowl),
      bodyLarge: TextStyle(fontSize: 25, color: AppColors.blackHowl),
      bodyMedium: TextStyle(fontSize: 20, color: AppColors.blackHowl),
      bodySmall: TextStyle(fontSize: 18, color: AppColors.blackHowl),
      displayLarge: TextStyle(fontSize: 16, color: AppColors.blackHowl),
      displayMedium: TextStyle(fontSize: 14, color: AppColors.blackHowl),
      displaySmall: TextStyle(fontSize: 12, color: AppColors.blackHowl),
    );
  }
}
