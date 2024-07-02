import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title, this.delay = Duration.zero});

  final String title;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeInLeft(
      delay: delay,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          height: size.height * 0.1,
          width: double.infinity,
          child: Row(
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
        ),
      ),
    );
  }
}
