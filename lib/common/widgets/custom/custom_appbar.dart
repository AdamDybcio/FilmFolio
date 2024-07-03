import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool hasBackButton;

  const CustomAppBar({super.key, required this.title, required this.hasBackButton});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: hasBackButton,
      title: title,
      centerTitle: true,
      leading: hasBackButton
          ? IconButton(
              icon: const FaIcon(FontAwesomeIcons.arrowLeft),
              onPressed: () {
                context.pop();
              },
            )
          : null,
      titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      elevation: 10,
    );
  }
}
