import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/core/dependency_injection/di.dart';
import 'package:movie_bloc_app/core/router/router_config.dart';
import 'package:movie_bloc_app/core/utils/themes/custom_theme.dart';

import 'common/blocs/bloc/nav_bar_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(init());

  //Used only for testing on different devices
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
    return BlocProvider(
      create: (_) => sl<NavBarBloc>()..add(const NavBarTapEvent(0)),
      child: MaterialApp.router(
        routerConfig: CustomGoRouterConfig().config,
        debugShowCheckedModeBanner: false,
        title: 'FilmFolio',
        theme: CustomTheme.lightTheme,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        darkTheme: CustomTheme.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
