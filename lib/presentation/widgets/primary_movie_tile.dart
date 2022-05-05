import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:desafio_tokenlab/presentation/controllers/core_controller.dart';

import '../../core/ui/scale.dart';
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

  Future<void> scaleUpScaleDownTile() async =>
      animationController.forward().then((value) => animationController.reverse());

  @override
  Widget build(BuildContext context) {
    final CoreController coreController = CoreController();
    final DateTime releaseDateParsed = DateTime.parse(widget.releaseDate);
    final String releaseDateFormatted = DateFormat.yMMMd().format(releaseDateParsed);
    return GestureDetector(
      onTap: () => {coreController.handleMovieTap(context, widget.id), scaleUpScaleDownTile()},
      child: ScaleTransition(
        scale: animationController,
        child: Container(
          padding: EdgeInsets.all(Scale.width(2)),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), borderRadius: AppBorderRadius.brAll5),
          alignment: Alignment.center,
          height: Scale.width(29),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                onTap: () => {coreController.handleMovieTap(context, widget.id), scaleUpScaleDownTile()},
                onLongPress: () => print(widget.id),
                enableFeedback: true,
                trailing: SizedBox(
                  width: Scale.width(10),
                  child: CachedNetworkImage(
                    errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                    imageUrl: widget.posterUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                leading: CircleAvatar(child: Text(widget.voteAverage.toString())),
                title: Text(
                  widget.title,
                  style: TextStyle(color: Colors.white, fontSize: AppFontSize.s1),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: Scale.width(2)),
                  child: Text("Release date: " + releaseDateFormatted + "\nGenres: " + widget.genres,
                      style: TextStyle(color: Colors.white, fontSize: AppFontSize.s3)),
                ),
              ),
              StarsCount(voteAverage: widget.voteAverage)
            ],
          ),
        ),
      ),
    );
  }
}
