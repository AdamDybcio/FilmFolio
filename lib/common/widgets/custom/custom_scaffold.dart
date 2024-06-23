import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.child, this.appbar, this.bottomNavigationBar});

  final Widget child;
  final PreferredSizeWidget? appbar;
  final PreferredSizeWidget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar,
        bottomNavigationBar: bottomNavigationBar,
        body: Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 16, left: 16),
          child: child,
        ),
      ),
    );
  }
}
