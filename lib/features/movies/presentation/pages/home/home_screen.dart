import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/widgets/custom_appbar.dart';
import 'package:movie_bloc_app/common/widgets/custom_scaffold.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/home/custom_movie_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appbar: CustomAppBar(
        title: Text('Movie App'),
      ),
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
