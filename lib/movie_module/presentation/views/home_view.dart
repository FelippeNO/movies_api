import 'package:desafio_tokenlab/movie_module/presentation/controllers/home_view_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core_module/nav/core_navigator.dart';
import '../../../core_module/ui/colors.dart';
import '../../../core_module/ui/scale.dart';
import '../../domain/entities/movie_snapshot_entity.dart';
import '../../domain/entities/proxy/proxy_movie_snapshot_entity.dart';
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
  HomeViewController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: RoundedPrimaryAppBar(
        isHome: false,
        fontSize: AppFontSize.appBarTitleH1,
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: controller.areMoviesLoading,
        builder: (context, isLoading, _) {
          return Container(
            decoration: const BoxDecoration(gradient: AppGradients.backgroundGradient),
            child: isLoading == true
                ? const LoadingView(message: "Loading movies list...")
                : Padding(
                    padding: EdgeInsets.only(top: Scale.width(2)),
                    child: ListView.builder(
                      itemCount: controller.movies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(Scale.width(2)),
                          child: Column(
                            children: [
                              PrimaryMovieTile(
                                  index: index,
                                  id: controller.movies[index].id,
                                  voteAverage: controller.movies[index].voteAverage,
                                  title: controller.movies[index].title.toString(),
                                  posterUrl: controller.movies[index].posterUrl.toString(),
                                  genres: controller.movies[index].genres.join(", "),
                                  releaseDate: controller.movies[index].releaseDate),
                            ],
                          ),
                        );
                      },
                    )),
          );
        },
      ),
    );
  }
}
