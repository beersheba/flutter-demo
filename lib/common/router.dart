import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:home_task/screens/screens.dart';

import 'const.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreenRoute:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case tilesScreenRoute:
      return MaterialPageRoute(builder: (context) => const TilesScreen());
    case colorListScreenRoute:
      return MaterialPageRoute(builder: (context) => const ColorListScreen());
    case codelabScreenRoute:
      return MaterialPageRoute(builder: (context) => const CodelabScreen());
    case codelabSavedScreenRoute:
      final args = settings.arguments as Set<WordPair>;
      return MaterialPageRoute(builder: (context) => CodelabSavedScreen(words: args));
    default:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
