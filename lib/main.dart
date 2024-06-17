import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/router/router_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: CustomGoRouterConfig().config,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movies',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
