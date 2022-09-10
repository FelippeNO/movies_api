import 'package:cached_network_image/cached_network_image.dart';
import '../../core_module/network/fakes_url.dart';
import '../../core_module/ui/colors.dart';
import '../../movie_module/domain/entities/movie_snapshot_entity.dart';
import '../../core_module/ui/scale.dart';
import '../controllers/core_controller.dart';
import 'loading_view.dart';
import '../widgets/rounded_primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailedView extends StatefulWidget {
  final int movieId;
  final int index;

  const DetailedView({Key? key, required this.movieId, required this.index}) : super(key: key);

  @override
  State<DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  CoreController coreController = CoreController();

  @override
  void initState() {
    super.initState();
    coreController.getMovieByIdService(widget.movieId, context);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("BUILDOU 2");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: RoundedPrimaryAppBar(
        height: 1.0,
        fontSize: AppFontSize.s0,
      ),
      body: ValueListenableBuilder<bool>(
          valueListenable: coreController.movieLoading,
          builder: (context, isLoading, _) {
            return Container(
              decoration: const BoxDecoration(gradient: AppGradients.backgroundGradient),
              child: isLoading == true
                  ? const LoadingView(message: "Loading movie data...")
                  : ValueListenableBuilder<MovieEntity>(
                      valueListenable: coreController.movie,
                      builder: (context, movie, _) {
                        DateTime releaseDateParsed = DateTime.parse(movie.releaseDate!);
                        String releaseDate = DateFormat.yMMMd().format(releaseDateParsed);
                        return ListView(
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
                                        movie.title!,
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
                                            imageUrl: movie.posterUrl!,
                                            errorWidget: (context, url, error) => Center(
                                                child: CachedNetworkImage(imageUrl: FakesUrl.fakeUrls[widget.index])),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: Scale.width(5)),
                                        child: Text(
                                          movie.overview!,
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
                                                    metric: "  Release Date: " + releaseDate, icon: Icons.date_range),
                                                MetricsTags(
                                                    metric: "  Popularity: " + movie.popularity.toString(),
                                                    icon: Icons.people_alt),
                                                MetricsTags(
                                                  metric: "  Vote Count: " +
                                                      NumberFormat.decimalPattern("en-EUA").format(movie.voteCount),
                                                  icon: Icons.thumb_up,
                                                ),
                                                MetricsTags(
                                                    metric: "  Budget: " +
                                                        NumberFormat.simpleCurrency().format(movie.budget),
                                                    icon: Icons.monetization_on),
                                                MetricsTags(
                                                    metric: "  Vote Average: " + movie.voteAverage.toString(),
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
                        );
                      },
                    ),
            );
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
