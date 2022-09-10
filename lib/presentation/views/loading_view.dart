import '../../core_module/ui/colors.dart';
import '../../core_module/ui/scale.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final String message;
  const LoadingView({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Scale.width(10)),
                child: Text(
                  message,
                  style: TextStyle(fontSize: AppFontSize.s0, color: AppColors.goldenYellow),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: Scale.width(8),
            ),
            const CircularProgressIndicator(color: AppColors.sangria)
          ],
        ),
      ),
    );
  }
}
