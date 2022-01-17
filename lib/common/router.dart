import 'package:english_words/english_words.dart';
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
    case codelabScreenRoute:
      return MaterialPageRoute(builder: (context) => const Codelab());
    case codelabSavedScreenRoute:
      final args = settings.arguments as Set<WordPair>;
      return MaterialPageRoute(builder: (context) => CodelabSaved(words: args));
    default:
      return MaterialPageRoute(builder: (context) => const Home());
  }
}
