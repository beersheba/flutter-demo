import 'package:flutter/material.dart';

import 'common/const.dart';
import 'common/router.dart' as router;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Task',
      initialRoute: homeScreenRoute,
      onGenerateRoute: router.generateRoute,
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
