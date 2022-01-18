import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:home_task/common/const.dart';
import 'package:home_task/screens/base_screen.dart';

class CodelabSavedScreen extends StatelessWidget {
  final Set<WordPair> words;

  const CodelabSavedScreen({required this.words, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tiles = [
      for (final pair in words)
        ListTile(title: Text(pair.asPascalCase, style: biggerFont)),
    ];

    return BaseScreen(
      body: ListView(
        children: tiles.isNotEmpty
            ? ListTile.divideTiles(
                context: context,
                tiles: tiles,
              ).toList()
            : [],
      ),
      title: 'Saved Suggestions',
    );
  }
}
