import 'package:flutter/material.dart';

import '../../../main.dart';

class GeneralSnackBar extends SnackBar {
  final String message;
  final rootScaffoldMessengerKey = Core.rootScaffoldMessengerKey;

  GeneralSnackBar(this.message, {Key? key})
      : super(
          key: key,
          content: Text(message),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        );

  void show() {
    // ignore: unnecessary_null_comparison
    if (rootScaffoldMessengerKey != null) {
      rootScaffoldMessengerKey.currentState!.showSnackBar(GeneralSnackBar(message));
    } else {}
  }
}
