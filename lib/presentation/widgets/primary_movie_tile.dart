import 'package:cached_network_image/cached_network_image.dart';
import '../../core/ui/scale.dart';
import 'stars_count_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrimaryMovieTile extends StatelessWidget {
  double voteAverage;
  String title;
  String posterUrl;
  String genres;
  String releaseDate;

  PrimaryMovieTile({
    Key? key,
    required this.voteAverage,
    required this.title,
    required this.posterUrl,
    required this.genres,
    required this.releaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime releaseDateParsed = DateTime.parse(releaseDate);
    String releaseDateFormatted = DateFormat.yMMMd().format(releaseDateParsed);

    return Container(
      padding: EdgeInsets.all(Scale.width(2)),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: AppBorderRadius.brAll5),
      alignment: Alignment.center,
      height: Scale.width(29),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
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
    );
  }
}
