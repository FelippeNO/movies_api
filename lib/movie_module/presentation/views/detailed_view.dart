import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core_module/ui/colors.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/entities/movie_snapshot_entity.dart';
import '../../../core_module/ui/scale.dart';
import '../controllers/detailed_view_controller.dart';
import 'loading_view.dart';
import '../widgets/rounded_primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailedView extends StatefulWidget {
  final int movieId;
  const DetailedView({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  State<DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
//  DateTime releaseDateParsed = DateTime.parse(movie.releaseDate!);
//                         String releaseDate = DateFormat.yMMMd().format(releaseDateParsed);

  final DetailedViewController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.init(movieId: widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: RoundedPrimaryAppBar(
        height: 1.0,
        fontSize: AppFontSize.s0,
      ),
      body: ValueListenableBuilder<bool>(
          valueListenable: controller.isMovieLoading,
          builder: (context, isLoading, _) {
            return Container(
                decoration: const BoxDecoration(gradient: AppGradients.backgroundGradient),
                child: isLoading == true
                    ? const LoadingView(message: "Loading movie data...")
                    : ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: Scale.width(5)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: Scale.width(5)),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [Colors.white.withOpacity(0.02), Colors.white.withOpacity(0.1)]),
                                  borderRadius: BorderRadius.all(Radius.circular(Scale.width(5))),
                                ),
                                width: Scale.width(80),
                                child: Column(
                                  children: [
                                    SizedBox(height: Scale.width(5)),
                                    Text(
                                      controller.movie.title,
                                      style: TextStyle(
                                          fontSize: AppFontSize.appBarTitleH1,
                                          color: AppColors.goldenYellow,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: Scale.width(5)),
                                      child: SizedBox(
                                        height: Scale.width(43),
                                        child: CachedNetworkImage(
                                          imageUrl: controller.movie.posterUrl,
                                          errorWidget: (context, url, error) =>
                                              Center(child: CachedNetworkImage(imageUrl: controller.movie.posterUrl)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: Scale.width(5)),
                                      child: Text(
                                        controller.movie.overview,
                                        style: TextStyle(fontSize: AppFontSize.s2, color: Colors.white),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                    SizedBox(height: Scale.width(5)),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: Scale.width(5)),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              MetricsTags(
                                                  metric: "  Release Date: " + controller.movie.releaseDate,
                                                  icon: Icons.date_range),
                                              MetricsTags(
                                                  metric: "  Popularity: " + controller.movie.popularity.toString(),
                                                  icon: Icons.people_alt),
                                              MetricsTags(
                                                metric: "  Vote Count: " +
                                                    NumberFormat.decimalPattern("en-EUA")
                                                        .format(controller.movie.voteCount),
                                                icon: Icons.thumb_up,
                                              ),
                                              MetricsTags(
                                                  metric: "  Budget: " +
                                                      NumberFormat.simpleCurrency().format(controller.movie.budget),
                                                  icon: Icons.monetization_on),
                                              MetricsTags(
                                                  metric: "  Vote Average: " + controller.movie.voteAverage.toString(),
                                                  icon: Icons.star),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ));
          }),
    );
  }
}

//---------------------------------------------------//
class MetricsTags extends StatelessWidget {
  final String metric;
  final IconData? icon;
  final Color iconColor;
  const MetricsTags({Key? key, required this.metric, this.icon, this.iconColor = Colors.red}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Scale.width(3)),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          Text(
            metric,
            style: TextStyle(fontSize: AppFontSize.s2, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
