import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final Color? color;

  const Tile({this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
