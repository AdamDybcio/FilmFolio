import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/movies/presentation/pages/home/home_screen.dart';

class CustomGoRouterConfig {
  final GoRouter config = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
    ],
  );
}
