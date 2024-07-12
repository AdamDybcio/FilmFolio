import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HelperFunctions {
  static bool isDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  static Future<bool> hasConnection() async {
    final result = await InternetConnectionChecker().hasConnection;
    return result;
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.horizontal,
        content: Text(
          message,
          overflow: TextOverflow.ellipsis,
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
