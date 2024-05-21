import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/base_theme.dart';

import 'package:movie_app/view/main_view.dart';
import 'package:movie_app/view_model/detail_view_model.dart';
import 'package:movie_app/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
    runApp(MultiProvider(providers: [
   
    ChangeNotifierProvider<MainViewModel>(
      create: (context) => MainViewModel(),
      builder: (context, child) => const MyApp(),
    ),
     ChangeNotifierProvider<DetailViewModel>(
      create: (context) => DetailViewModel(),
      builder: (context, child) => const MyApp(),
    ),
  ]));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: baseTheme(),
      home: const SplashView(),
    );
  }
}
