import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core_module/nav/core_navigator.dart';
import '../../../core_module/ui/colors.dart';
import '../../../core_module/ui/scale.dart';
import '../../../core_module/ui/shadows.dart';
import 'stars_count_widget.dart';

class PrimaryMovieTile extends StatefulWidget {
  final int id;
  final double voteAverage;
  final String title;
  final String posterUrl;
  final String genres;
  final String releaseDate;

  const PrimaryMovieTile({
    Key? key,
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.posterUrl,
    required this.genres,
    required this.releaseDate,
  }) : super(key: key);

  @override
  State<PrimaryMovieTile> createState() => _PrimaryMovieTileState();
}

class _PrimaryMovieTileState extends State<PrimaryMovieTile> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 50), lowerBound: 1, upperBound: 1.05);
  }

  @override
  Widget build(BuildContext context) {
    final DateTime releaseDateParsed = DateTime.parse(widget.releaseDate);
    final String releaseDateFormatted = DateFormat.yMMMd().format(releaseDateParsed);
    return GestureDetector(
      onTap: () => CoreNavigator.movie.goToDetailedView(movieId: widget.id),
      child: ScaleTransition(
        scale: animationController,
        child: Container(
          padding: EdgeInsets.all(Scale.width(2)),
          decoration: BoxDecoration(
              boxShadow: AppShadows.bs1,
              border: Border.all(color: Colors.white.withOpacity(0.03), width: Scale.width(0.3)),
              borderRadius: AppBorderRadius.brAll5,
              gradient: LinearGradient(colors: [Colors.white.withOpacity(0.05), Colors.white.withOpacity(0.1)])),
          alignment: Alignment.center,
          height: Scale.width(39),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                onTap: () => CoreNavigator.movie.goToDetailedView(movieId: widget.id),
                enableFeedback: true,
                trailing: SizedBox(
                  width: Scale.width(10),
                  child: CachedNetworkImage(
                    errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                    imageUrl: widget.posterUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      child: Text(widget.voteAverage.toString()),
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(height: Scale.width(2)),
                    StarsCount(voteAverage: widget.voteAverage)
                  ],
                ),
                title: Text(
                  widget.title,
                  style: TextStyle(color: AppColors.goldenYellow, fontSize: AppFontSize.s1),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: Scale.width(2)),
                  child: Text("Release date: " + releaseDateFormatted + "\nGenres: " + widget.genres,
                      style: TextStyle(color: Colors.white, fontSize: AppFontSize.s3)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
