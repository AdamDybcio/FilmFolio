import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';

class CustomMovieCarousel extends StatelessWidget {
  const CustomMovieCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        color: AppColors.coolFrost,
      ),
    );
  }
}
