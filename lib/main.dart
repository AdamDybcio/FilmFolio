import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/core/dependency_injection/di.dart';
import 'package:movie_bloc_app/core/router/router_config.dart';
import 'package:movie_bloc_app/core/utils/themes/custom_theme.dart';
import 'package:movie_bloc_app/features/personalization/presentation/blocs/bloc/bookmarks_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

// import 'package:device_preview/device_preview.dart';

import 'common/blocs/bloc/nav_bar_bloc.dart';
import 'features/personalization/data/models/bookmarked_movie_hive.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await init();

  await Hive.initFlutter();
  Hive.registerAdapter(BookmarkedMovieAdapter());
  await Hive.openBox<BookmarkedMovie>('bookmarks');

  // Used only for testing on different devices
  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     builder: (context) => const MyApp(),
  //   ),
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<NavBarBloc>()),
        BlocProvider(create: (_) => sl<BookmarksBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: CustomGoRouterConfig().config,
        debugShowCheckedModeBanner: false,
        title: 'FilmFolio',
        theme: CustomTheme.lightTheme,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        darkTheme: CustomTheme.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
