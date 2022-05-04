import 'package:flutter/material.dart';

class AppColors {
  static const Color supernova = Color.fromRGBO(255, 191, 64, 1);
  static const Color darkGoldenrod = Color.fromRGBO(179, 122, 9, 1);
  static const Color dodgerBluePRIMARY = Color.fromRGBO(64, 139, 255, 1);
  static const Color denimSECUNDARY = Color.fromRGBO(27, 87, 179, 1);
  static const Color mayaBlueTERTIARY = Color.fromRGBO(89, 156, 255, 1);
  static const Color rollingStone = Color.fromRGBO(112, 112, 122, 1);
  static const Color cream = Color.fromRGBO(255, 255, 223, 1);
}

class AppGradients {
  static const LinearGradient primaryBlueGradientBCtTC =
      LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
    AppColors.denimSECUNDARY,
    AppColors.dodgerBluePRIMARY,
  ]);

  static const LinearGradient secundaryBlueGradientTLtBR =
      LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    AppColors.mayaBlueTERTIARY,
    AppColors.dodgerBluePRIMARY,
  ]);

  static LinearGradient supernovaGradient =
      LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    AppColors.supernova.withOpacity(0.8),
    AppColors.cream,
  ]);

  static LinearGradient supernovaGradientDark =
      LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    AppColors.supernova.withOpacity(0.8),
    Color.fromARGB(255, 255, 153, 0),
  ]);

  static LinearGradient transparent = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.white.withOpacity(0.1), Colors.white.withOpacity(0.2)]);
}
