import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';

class LightTextTheme {
  static TextTheme get lightTextTheme {
    return TextTheme(
      titleLarge: TextStyle(fontSize: 70, fontWeight: FontWeight.bold, color: AppColors.insomnia),
      titleMedium: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: AppColors.insomnia),
      titleSmall: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: AppColors.insomnia),
      headlineLarge: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: AppColors.insomnia),
      headlineMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: AppColors.insomnia),
      headlineSmall: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.insomnia),
      labelLarge: TextStyle(fontSize: 28, color: AppColors.insomnia),
      labelMedium: TextStyle(fontSize: 26, color: AppColors.insomnia),
      labelSmall: TextStyle(fontSize: 24, color: AppColors.insomnia),
      bodyLarge: TextStyle(fontSize: 22, color: AppColors.insomnia),
      bodyMedium: TextStyle(fontSize: 20, color: AppColors.insomnia),
      bodySmall: TextStyle(fontSize: 18, color: AppColors.insomnia),
      displayLarge: TextStyle(fontSize: 16, color: AppColors.insomnia),
      displayMedium: TextStyle(fontSize: 14, color: AppColors.insomnia),
      displaySmall: TextStyle(fontSize: 12, color: AppColors.insomnia),
    );
  }
}
