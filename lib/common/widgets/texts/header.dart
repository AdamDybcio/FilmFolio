import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title, this.delay = Duration.zero, this.onTap});

  final String title;
  final Duration delay;

  final VoidCallback? onTap;

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
              SizedBox(
                width: size.width * 0.7,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  overflow: TextOverflow.clip,
                ),
              ),
              const Spacer(),
              if (onTap != null)
                IconButton(
                  onPressed: onTap,
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
