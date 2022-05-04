import 'package:desafio_tokenlab/core/ui/colors.dart';
import 'package:desafio_tokenlab/core/ui/scale.dart';
import 'package:flutter/material.dart';

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
      leading: isHome == true ? null : const BackButton(color: AppColors.rollingStone),
      toolbarHeight: Scale.width(20),
      shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.brVerticalBot8),
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        "MOVIES",
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.rollingStone, fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * height);
}
