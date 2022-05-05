import 'package:flutter/material.dart';

class AppShadow {
  static BoxShadow s1 =
      BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 3.0, offset: Offset.zero, spreadRadius: 3);
}

class AppShadows {
  static List<BoxShadow> bs1 = [AppShadow.s1];
}
