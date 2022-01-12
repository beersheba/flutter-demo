import 'package:flutter/material.dart';
import 'package:home_task/screens/tiles.dart';

import 'screens/color_list.dart';
import 'screens/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Task',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/tiles': (context) => const Tiles(),
        '/list': (context) => const ColorList(),
      },
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 2,
          titleSpacing: 10,
        ),
        primarySwatch: Colors.lightBlue,
      ),
    );
  }
}
