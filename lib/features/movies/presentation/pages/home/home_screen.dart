import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/widgets/custom/custom_appbar.dart';
import 'package:movie_bloc_app/common/widgets/custom/custom_bottom_navbar.dart';
import 'package:movie_bloc_app/common/widgets/movie/custom_movie_backdrop.dart';
import 'package:movie_bloc_app/core/dependency_injection/di.dart';
import 'package:movie_bloc_app/features/movies/presentation/widgets/home/custom_movie_carousel.dart';

import '../../blocs/home/carousel/movie_carousel_bloc.dart';
import '../../widgets/home/movie_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<MovieCarouselBloc>()..add(const CarouselLoadEvent()),
        ),
        BlocProvider(create: (_) => sl<MovieCarouselBloc>().movieBackdropBloc),
      ],
      child: const Scaffold(
        appBar: CustomAppBar(
          title: Text('Movie App'),
        ),
        bottomNavigationBar: CustomBottomNavbar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CustomMovieBackdrop(),
                  CustomMovieCarousel(),
                  MovieTitle(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
