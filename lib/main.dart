import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_bloc_app/core/dependency_injection/di.dart';
import 'package:movie_bloc_app/core/router/router_config.dart';
import 'package:movie_bloc_app/core/utils/themes/custom_theme.dart';
import 'package:movie_bloc_app/features/personalization/presentation/blocs/bookmarks/bookmarks_bloc.dart';
import 'package:movie_bloc_app/features/personalization/presentation/blocs/settings/settings_bloc.dart';

// import 'package:device_preview/device_preview.dart';

import 'common/blocs/bloc/nav_bar_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/settings/user_settings.dart';
import 'features/personalization/data/models/bookmarked_movie_hive.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Hive.initFlutter();
  Hive.registerAdapter(BookmarkedMovieAdapter());
  await Hive.openBox<BookmarkedMovie>('bookmarks');
  await Hive.openBox('settings');
  await Hive.openBox('theme_mode');

  await initDependencyInjection();

  // Used only for testing on different devices
  // FlutterNativeSplash.remove();
  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     builder: (context) => const MyApp(),
  //   ),
  // );

  FlutterNativeSplash.remove();
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
        BlocProvider(create: (_) => sl<SettingsBloc>()..add(const ChangeSettings())),
      ],
      child: AdaptiveTheme(
        light: CustomTheme.lightTheme,
        dark: CustomTheme.darkTheme,
        initial: sl<UserSettings>().getThemeMode() == 'dark'
            ? AdaptiveThemeMode.dark
            : sl<UserSettings>().getThemeMode() == 'light'
                ? AdaptiveThemeMode.light
                : AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => MaterialApp.router(
          routerConfig: CustomGoRouterConfig().config,
          debugShowCheckedModeBanner: false,
          title: 'FilmFolio',
          theme: theme,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          darkTheme: darkTheme,
        ),
      ),
    );
  }
}
