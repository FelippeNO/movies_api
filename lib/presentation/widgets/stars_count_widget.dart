import '../../core/ui/scale.dart';
import 'package:flutter/material.dart';

class StarsCount extends StatelessWidget {
  final double voteAverage;

  StarsCount({Key? key, required this.voteAverage}) : super(key: key);

  final filledStars = Icon(Icons.star_rate, size: Scale.width(2.7), color: Colors.yellow);
  final unfilledStars = Icon(Icons.star_outline, size: Scale.width(2.7));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: Scale.width(2.4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 0; i < 5; i++)
            if (i * 2 < voteAverage) filledStars else unfilledStars
        ],
      ),
    );
  }
}
