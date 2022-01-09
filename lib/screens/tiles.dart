import 'dart:math';

import 'package:flutter/material.dart';
import 'package:home_task/const.dart';
import 'package:home_task/widgets/tile.dart';

class Tiles extends StatefulWidget {
  const Tiles({Key? key}) : super(key: key);

  @override
  State<Tiles> createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
  List<Color> colors = List.filled(4, Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () => Navigator.pop(context),
            );
          },
        ),
        title: const Text(title1),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.only(top: 80, left: 25, right: 25),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          for (int i = 0; i < 4; i++)
            Tile(
              color: colors[i],
            )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          child: const Icon(Icons.edit_outlined),
          onPressed: () => setState(() {
            colors = List.generate(4, (index) => generateColor());
          }),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
    );
  }
}

Color generateColor() {
  int max = 255;
  Random random = Random();
  int r = random.nextInt(max);
  int g = random.nextInt(max);
  int b = random.nextInt(max);
  return Color.fromARGB(max, r, g, b);
}
