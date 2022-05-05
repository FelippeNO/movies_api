import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:desafio_tokenlab/presentation/controllers/core_controller.dart';

import '../../core/ui/scale.dart';
import 'stars_count_widget.dart';

class PrimaryMovieTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final CoreController coreController = CoreController();
    final DateTime releaseDateParsed = DateTime.parse(releaseDate);
    final String releaseDateFormatted = DateFormat.yMMMd().format(releaseDateParsed);

    return GestureDetector(
      onTap: () => coreController.handleMovieTap(context, id),
      child: Container(
        padding: EdgeInsets.all(Scale.width(2)),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: AppBorderRadius.brAll5),
        alignment: Alignment.center,
        height: Scale.width(29),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: () => coreController.handleMovieTap(context, id),
              onLongPress: () => print(id),
              selectedTileColor: Colors.red,
              enableFeedback: true,
              trailing: SizedBox(
                width: Scale.width(10),
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                  imageUrl: posterUrl,
                  fit: BoxFit.cover,
                ),
              ),
              leading: CircleAvatar(child: Text(voteAverage.toString())),
              title: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: AppFontSize.s1),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: Scale.width(2)),
                child: Text("Release date: " + releaseDateFormatted + "\nGenres: " + genres,
                    style: TextStyle(color: Colors.white, fontSize: AppFontSize.s3)),
              ),
            ),
            StarsCount(voteAverage: voteAverage)
          ],
        ),
      ),
    );
  }
}
