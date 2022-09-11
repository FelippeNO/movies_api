import 'package:desafio_tokenlab/movie_module/presentation/controllers/home_view_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core_module/ui/colors.dart';
import '../../../core_module/ui/scale.dart';
import '../../../core_module/utils/app_connection_state.dart';
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
    AppConnectionState.check();
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
      body: ValueListenableBuilder<HomeViewState>(
        valueListenable: controller.state,
        builder: (context, state, _) {
          switch (state) {
            case HomeViewState.loading:
              return const LoadingView(
                message: "Filmes sendo carregados...",
              );
            case HomeViewState.success:
              return Container(
                decoration: const BoxDecoration(gradient: AppGradients.backgroundGradient),
                child: Padding(
                  padding: EdgeInsets.only(top: Scale.width(2)),
                  child: ListView.builder(
                    itemCount: controller.movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(Scale.width(2)),
                        child: Column(
                          children: [
                            PrimaryMovieTile(
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
                  ),
                ),
              );
            case HomeViewState.failure:
              return Center(
                child: Container(
                  decoration: const BoxDecoration(gradient: AppGradients.backgroundGradient),
                  height: Scale.heightDevice,
                  width: Scale.widthDevice,
                  child: Center(
                      child: SizedBox(
                    height: Scale.width(10),
                    width: Scale.width(50),
                    child: FloatingActionButton(
                      backgroundColor: Colors.red,
                      onPressed: () => controller.init(),
                      child: const Text("Clique aqui para recarregar", style: TextStyle(color: AppColors.goldenYellow)),
                    ),
                  )),
                ),
              );
          }
        },
      ),
    );
  }
}
