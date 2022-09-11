import 'package:flutter/material.dart';

import '../../../core_module/ui/colors.dart';
import '../../../core_module/ui/scale.dart';

class AppTextField extends StatelessWidget {
  final String text;
  final bool obscureText;
  final TextInputType keyboardType;
  const AppTextField({Key? key, required this.text, this.obscureText = false, this.keyboardType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      style: const TextStyle(color: AppColors.sangria),
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.40),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.sangria),
          borderRadius: AppBorderRadius.brAll3,
        ),
        focusColor: AppColors.sangria,
        labelText: text,
        labelStyle: TextStyle(color: AppColors.sangria, fontWeight: FontWeight.w400, fontSize: AppFontSize.s2),
      ),
    );
  }
}
