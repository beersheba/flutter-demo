import 'package:flutter/material.dart';
import 'package:home_task/screens/base_screen.dart';
import 'package:home_task/common/util.dart';

import '../common/const.dart';

class ColorList extends StatefulWidget {
  const ColorList({Key? key}) : super(key: key);

  @override
  _ColorListState createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  late List<Color> _colors;

  @override
  void initState() {
    super.initState();
    _colors = List.filled(1000, Colors.grey);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: _colors.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: _colors[index],
          );
        },
      ),
      title: title2,
      onFabPressed: () => setState(() {
        _colors = generateColors(1000);
      }),
    );
  }
}
