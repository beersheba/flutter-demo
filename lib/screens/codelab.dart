import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:home_task/common/const.dart';
import 'package:home_task/screens/base_screen.dart';

class CodelabScreen extends StatefulWidget {
  const CodelabScreen({Key? key}) : super(key: key);

  @override
  _CodelabScreenState createState() => _CodelabScreenState();
}

class _CodelabScreenState extends State<CodelabScreen> {
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
      body: NotificationListener<ScrollEndNotification>(
        onNotification: (_) {
          _generateSuggestions();
          return true;
        },
        child: ListView.separated(
          itemCount: _suggestions.length,
          separatorBuilder: (context, index) => const Divider(),
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                _suggestions[index].asPascalCase,
                style: biggerFont,
              ),
              trailing: Icon(
                _alreadySaved(index) ? Icons.favorite : Icons.favorite_border,
                color: _alreadySaved(index) ? Colors.red : null,
                semanticLabel:
                    _alreadySaved(index) ? 'Remove from saved' : 'Save',
              ),
              onTap: () {
                setState(() {
                  _manageSaved(_alreadySaved(index), _suggestions[index]);
                });
              },
            );
          },
        ),
      ),
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

  void _manageSaved(bool alreadySaved, WordPair pair) {
    if (alreadySaved) {
      _saved.remove(pair);
    } else {
      _saved.add(pair);
    }
  }

  bool _alreadySaved(int index) {
    return _saved.contains(_suggestions[index]);
  }

  void _pushSaved() {
    Navigator.pushNamed(
      context,
      codelabSavedScreenRoute,
      arguments: _saved,
    );
  }
}
