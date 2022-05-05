import 'package:desafio_tokenlab/core/ui/colors.dart';

import '../../core/ui/scale.dart';
import '../../domain/entities/movie_data_entity.dart';
import '../../domain/entities/movies_entity.dart';
import '../controllers/core_controller.dart';
import 'loading_view.dart';
import '../widgets/primary_movie_tile.dart';
import '../widgets/rounded_primary_app_bar.dart';
import "package:flutter/material.dart";

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> with TickerProviderStateMixin {
  late List<MovieEntity> movies;
  MovieDataEntity movie = MovieDataEntity(id: 0);
  CoreController coreController = CoreController();

  @override
  void initState() {
    super.initState();
    coreController.initialize();
    movies = CoreController.movies.value;
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
        valueListenable: coreController.moviesLoading,
        builder: (context, isLoading, _) {
          return Container(
            decoration: const BoxDecoration(gradient: AppGradients.backgroundGradient),
            child: isLoading == true
                ? const LoadingView(message: "Aguarde enquanto seus filmes carregam!")
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
