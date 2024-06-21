import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/core/dependency_injection/di.dart';
import 'package:movie_bloc_app/core/router/router_config.dart';
import 'package:movie_bloc_app/core/utils/themes/custom_theme.dart';
import 'package:movie_bloc_app/features/movies/presentation/blocs/home/carousel/movie_carousel_bloc.dart';

Future<void> main() async {
  unawaited(init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<MovieCarouselBloc>()..add(CarouselLoadEvent())),
      ],
      child: MaterialApp.router(
        routerConfig: CustomGoRouterConfig().config,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Movies',
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
