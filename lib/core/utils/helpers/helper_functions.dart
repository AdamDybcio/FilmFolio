import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HelperFunctions {
  static bool isDarkMode(BuildContext context) {
    if (AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark) {
      return true;
    } else if (AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light) {
      return false;
    } else if (AdaptiveTheme.of(context).mode == AdaptiveThemeMode.system) {
      final brightness = MediaQuery.of(context).platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return false;
    }
  }

  static Future<bool> hasConnection() async {
    final result = await InternetConnectionChecker().hasConnection;
    return result;
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        animation: CurvedAnimation(
          parent: AnimationController(
            duration: const Duration(milliseconds: 500),
            vsync: ScaffoldMessenger.of(context),
          ),
          curve: Curves.linear,
        ),
        content: Text(
          message,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
