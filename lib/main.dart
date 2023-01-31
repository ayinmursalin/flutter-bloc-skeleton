import 'package:bloc_skeleton/common_ui/color_schemes.g.dart';
import 'package:bloc_skeleton/di.dart';
import 'package:bloc_skeleton/src/example/presentation/example/example_page.dart';
import 'package:bloc_skeleton/src/main/presentation/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.Up
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Skeleton',
      theme: ThemeData(
        colorScheme: lightColorScheme,
        navigationBarTheme: const NavigationBarThemeData(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MainPage.route,
      routes: {
        MainPage.route: (ctx) => const MainPage(),
        ExamplePage.route: (ctx) => const ExamplePage(),
      },
    );
  }
}
