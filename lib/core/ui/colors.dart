import 'package:flutter/material.dart';

class AppColors {
  static const Color goldenYellow = Color.fromARGB(255, 255, 217, 0);
  static const Color sangria = Color.fromARGB(255, 158, 11, 0);
  static const Color temptress = Color.fromARGB(255, 70, 5, 0);
  static const Color diesel = Color.fromARGB(255, 32, 0, 0);
}

class AppGradients {
  static LinearGradient transparent = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.white.withOpacity(0.1), Colors.white.withOpacity(0.2)]);

  static const LinearGradient backgroundGradient =
      LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    AppColors.temptress,
    AppColors.diesel,
    Colors.black,
  ]);
}
