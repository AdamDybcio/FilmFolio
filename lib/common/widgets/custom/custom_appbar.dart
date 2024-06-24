import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return AppBar(
      title: title,
      centerTitle: true,
      titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      backgroundColor: dark ? AppColors.magicWhale : AppColors.coolFrost,
      elevation: 0,
    );
  }
}
