import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool hasBackButton;

  const CustomAppBar({super.key, required this.title, required this.hasBackButton});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return SliverAppBar(
      pinned: false,
      title: title,
      centerTitle: true,
      leading: hasBackButton
          ? IconButton(
              icon: FaIcon(FontAwesomeIcons.arrowLeft, color: dark ? AppColors.diamondCut : AppColors.magicWhale),
              onPressed: () {
                context.pop();
              },
            )
          : null,
      titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      backgroundColor: dark ? AppColors.magicWhale : AppColors.coolFrost,
      elevation: 0,
    );
  }
}
