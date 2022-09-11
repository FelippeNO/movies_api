import 'package:connectivity_plus/connectivity_plus.dart';
import 'widgets/general_snackbar.dart';
import 'package:flutter/material.dart';

class AppConnectionState {
  static void check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      debugPrint("NOT CONNECTED");
      GeneralSnackBar("Não há conexão com a internet").show();
    }
  }
}
