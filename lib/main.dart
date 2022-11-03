import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_challenge/ui/home_screen.dart';
import 'package:flutter_challenge/utils/injector/project_injector.dart';
import 'package:flutter_challenge/utils/routes.dart';
import 'package:flutter_challenge/utils/theme/theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await runZonedGuarded(
    () async {
      await setupProjectInjector().then((value) {
        runApp(ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
          builder: (context, child) => const MyApp(),
        ));
      });
    },
    (error, stack) => log('error $error'),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        provider.setTheme();

        return MaterialApp(
          theme: provider.themeData,
          debugShowCheckedModeBanner: false,
          routes: Routes.route,
          home: const HomeScreen(),
        );
      },
    );
  }
}
