import 'package:flutter/material.dart';

import 'const.dart';
import 'screens/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Task',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 2,
          titleSpacing: 10,
        ),
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text(
            titleMain,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0, 5),
                  blurRadius: 9,
                  color: Colors.black26,
                ),
              ],
            ),
          ),
        ),
        body: const Home(),
      ),
    );
  }
}
