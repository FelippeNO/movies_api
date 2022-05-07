import '../../core/ui/colors.dart';
import '../../core/ui/scale.dart';
import '../../domain/entities/movie_entity.dart';
import '../controllers/core_controller.dart';
import 'loading_view.dart';
import '../widgets/primary_movie_tile.dart';
import '../widgets/rounded_primary_app_bar.dart';
import "package:flutter/material.dart";

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late List<MovieEntity> movies;
  CoreController coreController = CoreController();

  @override
  void initState() {
    super.initState();
    coreController.initialize(context);
    movies = CoreController.movies.value;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("BUILDOU 1");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: RoundedPrimaryAppBar(
        isHome: false,
        fontSize: AppFontSize.appBarTitleH1,
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: coreController.moviesLoading,
        builder: (context, isLoading, _) {
          return Container(
            decoration: const BoxDecoration(gradient: AppGradients.backgroundGradient),
            child: isLoading == true
                ? const LoadingView(message: "Loading movies list...")
                : Padding(
                    padding: EdgeInsets.only(top: Scale.width(2)),
                    child: ValueListenableBuilder<List<MovieEntity>>(
                      valueListenable: CoreController.movies,
                      builder: (context, movies, _) {
                        return ListView.builder(
                          itemCount: movies.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.all(Scale.width(2)),
                              child: Column(
                                children: [
                                  PrimaryMovieTile(
                                      index: index,
                                      id: movies[index].id!,
                                      voteAverage: movies[index].voteAverage!,
                                      title: movies[index].title.toString(),
                                      posterUrl: movies[index].posterUrl.toString(),
                                      genres: movies[index].genres!.join(", "),
                                      releaseDate: movies[index].releaseDate!),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
