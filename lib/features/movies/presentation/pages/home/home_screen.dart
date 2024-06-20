import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/widgets/custom_scaffold.dart';

import '../../widgets/custom_movie_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomMovieCarousel(),
        ],
      ),
    );
  }
}
