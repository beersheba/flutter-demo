import 'package:flutter/material.dart';
import 'package:home_task/common/const.dart';
import 'package:home_task/screens/base_screen.dart';
import 'package:home_task/widgets/tile.dart';

import '../common/util.dart';

class TilesScreen extends StatefulWidget {
  const TilesScreen({Key? key}) : super(key: key);

  @override
  State<TilesScreen> createState() => _TilesScreenState();
}

class _TilesScreenState extends State<TilesScreen> {
  late List<Color> _colors;

  @override
  void initState() {
    super.initState();
    _colors = List.filled(4, Colors.grey);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.only(top: 80, left: 25, right: 25),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          for (int i = 0; i < 4; i++)
            Tile(
              color: _colors[i],
            )
        ],
      ),
      title: title1,
      onFabPressed: () => setState(() {
        _colors = generateColors(4);
      }),
    );
  }
}
