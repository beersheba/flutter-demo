import 'package:flutter/material.dart';
import 'package:home_task/screens/screens.dart';

import 'const.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreenRoute:
      return MaterialPageRoute(builder: (context) => const Home());
    case tilesScreenRoute:
      return MaterialPageRoute(builder: (context) => const Tiles());
    case colorListScreenRoute:
      return MaterialPageRoute(builder: (context) => const ColorList());
    default:
      return MaterialPageRoute(builder: (context) => const Home());
  }
}
