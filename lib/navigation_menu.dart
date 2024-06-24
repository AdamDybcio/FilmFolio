import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/blocs/bloc/nav_bar_bloc.dart';
import 'package:movie_bloc_app/common/widgets/custom/custom_appbar.dart';
import 'package:movie_bloc_app/core/dependency_injection/di.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/carousel/movie_carousel_bloc.dart';

import 'common/widgets/custom/custom_bottom_navbar.dart';
import 'features/movies/presentation/pages/home/home_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<MovieCarouselBloc>()..add(const CarouselLoadEvent()),
        ),
        BlocProvider(create: (_) => sl<MovieCarouselBloc>().movieBackdropBloc),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(
          title: Text('Movie App'),
        ),
        bottomNavigationBar: const CustomBottomNavbar(),
        body: BlocBuilder<NavBarBloc, NavBarState>(
          builder: (context, state) {
            if (state is NavBarInitial) {
              return const HomeScreen();
            } else if (state is NavBarChanged) {
              if (state.currentIndex == 0) {
                return const HomeScreen();
              } else if (state.currentIndex == 1) {
                return Container();
              } else if (state.currentIndex == 2) {
                return Container();
              } else if (state.currentIndex == 3) {
                return Container();
              }
            }
            return const HomeScreen();
          },
        ),
      ),
    );
  }
}
