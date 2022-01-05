import 'dart:math';

import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  const Tile({Key? key}) : super(key: key);

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getColor(),
    );
  }

  getColor() {
    if (color == null) {
      color = Colors.grey;
    } else {
      color = generateColor();
    }
    return color;
  }
}

generateColor() {
  int max = 255;
  Random random = Random();
  int r = random.nextInt(max);
  int g = random.nextInt(max);
  int b = random.nextInt(max);
  return Color.fromARGB(max, r, g, b);
}
