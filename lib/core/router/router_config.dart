import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_bloc_app/common/blocs/bloc/nav_bar_bloc.dart';
import 'package:movie_bloc_app/features/movies/data/models/movie_model.dart';
import 'package:movie_bloc_app/features/movies/presentation/pages/details/details_screen.dart';
import 'package:movie_bloc_app/navigation_menu.dart';

class CustomGoRouterConfig {
  final GoRouter config = GoRouter(
    errorBuilder: (context, state) {
      return BlocBuilder<NavBarBloc, NavBarState>(
        builder: (_, state2) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Page "${state.path}" not found'),
                  ElevatedButton(
                    onPressed: () {
                      context.go('/');
                      context.read<NavBarBloc>().add(const NavBarTapEvent(0));
                    },
                    child: const Text('Go back'),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const NavigationMenu();
        },
      ),
      GoRoute(
        path: '/details/:id',
        builder: (BuildContext context, GoRouterState state) {
          return DetailsScreen(movie: state.extra as MovieModel, id: state.pathParameters['id']!);
        },
      ),
    ],
  );
}
