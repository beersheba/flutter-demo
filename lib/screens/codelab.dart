import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:home_task/common/const.dart';
import 'package:home_task/screens/base_screen.dart';

class Codelab extends StatefulWidget {
  const Codelab({Key? key}) : super(key: key);

  @override
  _CodelabState createState() => _CodelabState();
}

class _CodelabState extends State<Codelab> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: _buildSuggestions(),
      title: title3,
      actions: [
        IconButton(
          icon: const Icon(Icons.list),
          onPressed: _pushSaved,
          tooltip: 'Saved Suggestions',
        ),
      ],
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return const Divider();
        }
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
        semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    final tiles = _saved.map(
      (pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
    final divided = tiles.isNotEmpty
        ? ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList()
        : <Widget>[];

    Navigator.pushNamed(context, codelabSavedScreenRoute, arguments: divided);
  }
}
