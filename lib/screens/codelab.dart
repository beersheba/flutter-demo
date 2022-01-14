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
  late List<WordPair> _suggestions;
  late Set<WordPair> _saved;

  @override
  void initState() {
    super.initState();
    _suggestions = <WordPair>[];
    _saved = <WordPair>{};
    _generateSuggestions();
  }

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

  void _generateSuggestions() {
    setState(() {
      _suggestions.addAll(generateWordPairs().take(10));
    });
  }

  Widget _buildSuggestions() {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (_) {
        _generateSuggestions();
        return true;
      },
      child: ListView.separated(
        itemCount: _suggestions.length,
        separatorBuilder: (context, index) => const Divider(),
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return _buildRow(_suggestions[index]);
        },
      ),
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
        semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
      ),
      onTap: () {
        setState(() {
          _manageSaved(alreadySaved, pair);
        });
      },
    );
  }

  void _manageSaved(bool alreadySaved, WordPair pair) {
    if (alreadySaved) {
      _saved.remove(pair);
    } else {
      _saved.add(pair);
    }
  }

  void _pushSaved() {
    final tiles = _saved.map(
      (pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: biggerFont,
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

    Navigator.pushNamed(
      context,
      codelabSavedScreenRoute,
      arguments: divided,
    );
  }
}
