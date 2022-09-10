import '../../../core_module/ui/colors.dart';
import '../../../core_module/ui/scale.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const LoginButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Scale.width(50),
      height: Scale.width(15),
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.brAll3,
        border: Border.all(color: AppColors.sangria),
        color: Colors.black.withOpacity(0.45),
      ),
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(color: AppColors.sangria, fontSize: AppFontSize.s1),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
