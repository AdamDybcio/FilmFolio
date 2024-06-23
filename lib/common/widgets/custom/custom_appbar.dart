import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
