import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.insomnia,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeIn(
            child: Center(
              child: Text(
                'Home Screen',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          FadeInRightBig(
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColors.perfume)),
              child: Text(
                'Button',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
