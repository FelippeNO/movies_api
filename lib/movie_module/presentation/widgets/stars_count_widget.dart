import '../../../core_module/ui/colors.dart';
import '../../../core_module/ui/scale.dart';
import 'package:flutter/material.dart';

class StarsCount extends StatelessWidget {
  final double voteAverage;

  StarsCount({Key? key, required this.voteAverage}) : super(key: key);

  final filledStars = Icon(Icons.star_rate, size: Scale.width(2.7), color: AppColors.goldenYellow);
  final unfilledStars = Icon(Icons.star_outline, size: Scale.width(2.7));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Scale.width(15),
      height: Scale.width(1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 5; i++)
            if (i * 2 < voteAverage) filledStars else unfilledStars
        ],
      ),
    );
  }
}
