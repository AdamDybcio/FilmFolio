import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/common/blocs/bloc/nav_bar_bloc.dart';
import 'package:movie_bloc_app/common/widgets/appbars_navbars/custom_appbar.dart';
import 'package:movie_bloc_app/core/dependency_injection/di.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/home/home_bloc.dart';
import 'package:movie_bloc_app/features/movies/presentation/pages/search/search_screen.dart';
import 'package:movie_bloc_app/features/personalization/presentation/pages/settings/settings_screen.dart';

import 'common/widgets/appbars_navbars/custom_bottom_navbar.dart';
import 'features/movies/presentation/pages/home/home_screen.dart';
import 'features/personalization/presentation/pages/bookmarks/bookmarks_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const CustomBottomNavbar(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              CustomAppBar(
                hasBackButton: false,
                title: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    'FilmFolio',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                actions: const [],
              ),
            ];
          },
          body: BlocBuilder<NavBarBloc, NavBarState>(
            builder: (context, state) {
              if (state is NavBarInitial) {
                return const HomeScreen();
              } else if (state is NavBarChanged) {
                if (state.currentIndex == 0) {
                  return const HomeScreen();
                } else if (state.currentIndex == 1) {
                  return const SearchScreen();
                } else if (state.currentIndex == 2) {
                  return const BookmarksScreen();
                } else if (state.currentIndex == 3) {
                  return const SettingsScreen();
                }
              }
              return const HomeScreen();
            },
          ),
        ),
      ),
    );
  }
}
