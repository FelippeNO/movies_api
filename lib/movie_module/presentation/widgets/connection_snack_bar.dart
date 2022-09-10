import 'package:flutter/material.dart';
import '../../../core_module/ui/colors.dart';

class ConnectionSnackBar extends SnackBar {
  const ConnectionSnackBar({Key? key})
      : super(
            key: key,
            content: const Text("You are offline. Only offline movies will be loaded. Go online to load new movies."),
            backgroundColor: AppColors.sangria);
}
