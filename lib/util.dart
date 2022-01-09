import 'dart:math';

import 'package:flutter/material.dart';

Color generateColor() {
  int max = 255;
  Random random = Random();
  int r = random.nextInt(max);
  int g = random.nextInt(max);
  int b = random.nextInt(max);
  return Color.fromARGB(max, r, g, b);
}
