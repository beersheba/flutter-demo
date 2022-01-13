import 'package:flutter/material.dart';
import 'package:home_task/screens/base_screen.dart';

class CodelabSaved extends StatelessWidget {
  final List<Widget> words;

  const CodelabSaved({required this.words, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: ListView(children: words),
      title: 'Saved Suggestions',
    );
  }
}
