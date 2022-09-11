import 'package:flutter/material.dart';

import '../../../core_module/ui/colors.dart';
import '../../../core_module/ui/scale.dart';

class RoundedPrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double fontSize;
  final bool isHome;
  final double height;

  const RoundedPrimaryAppBar({
    Key? key,
    this.fontSize = 18,
    this.isHome = false,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isHome == true ? null : const BackButton(color: AppColors.goldenYellow),
      toolbarHeight: Scale.width(20),
      shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.brVerticalBot8),
      backgroundColor: AppColors.sangria,
      centerTitle: true,
      title: Text(
        "MOVIES",
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.goldenYellow, fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * height);
}
