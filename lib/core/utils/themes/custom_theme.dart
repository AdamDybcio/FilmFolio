import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';
import 'package:movie_bloc_app/core/utils/themes/dark/dark_text_theme.dart';
import 'package:movie_bloc_app/core/utils/themes/light/light_text_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.diamondCut).copyWith(brightness: Brightness.light),
      textTheme: LightTextTheme.lightTextTheme,
      scaffoldBackgroundColor: AppColors.diamondCut,
      useMaterial3: true,
      fontFamily: GoogleFonts.poppinsTextTheme().headlineMedium!.fontFamily,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.insomnia).copyWith(brightness: Brightness.dark),
      textTheme: DarkTextTheme.darkTextTheme,
      scaffoldBackgroundColor: AppColors.insomnia,
      useMaterial3: true,
      fontFamily: GoogleFonts.poppinsTextTheme().headlineMedium!.fontFamily,
    );
  }
}
