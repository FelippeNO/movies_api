import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_tokenlab/core/ui/scale.dart';
import 'package:desafio_tokenlab/domain/entities/movie_data_entity.dart';
import 'package:desafio_tokenlab/presentation/controllers/core_controller.dart';
import 'package:desafio_tokenlab/presentation/views/tela_inicial.dart';
import 'package:desafio_tokenlab/presentation/widgets/rounded_primary_app_bar.dart';
import 'package:flutter/material.dart';

class DetailedView extends StatefulWidget {
  final int movieId;

  const DetailedView({Key? key, required this.movieId}) : super(key: key);

  @override
  State<DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  CoreController coreController = CoreController();

  @override
  void initState() {
    super.initState();
    coreController.initialize();
    coreController.getMovieByIdService(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: RoundedPrimaryAppBar(
        fontSize: AppFontSize.s0,
      ),
      body: ValueListenableBuilder(
          valueListenable: coreController.movieLoading,
          builder: (context, value, _) {
            bool isLoading = coreController.movieLoading.value;
            return Container(
              color: Colors.black,
              child: isLoading == true
                  ? const Center(child: CircularProgressIndicator())
                  : ValueListenableBuilder(
                      valueListenable: coreController.movieD,
                      builder: (context, value, _) {
                        MovieDataEntity movie = coreController.movieD.value;
                        return ListView(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: Scale.width(10)),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.all(Radius.circular(Scale.width(5))),
                                  ),
                                  width: Scale.width(80),
                                  child: Column(children: [
                                    SizedBox(height: Scale.width(5)),
                                    Text(
                                      movie.title!,
                                      style: TextStyle(fontSize: AppFontSize.s1, color: Colors.white),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: Scale.width(5)),
                                      child: SizedBox(
                                        height: Scale.width(50),
                                        child: CachedNetworkImage(imageUrl: movie.posterUrl!),
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
                                    SizedBox(height: Scale.width(3)),
                                    Text(
                                      movie.releaseDate!,
                                      style: TextStyle(fontSize: AppFontSize.s2, color: Colors.white),
                                    ),
                                    SizedBox(height: Scale.width(3)),
                                    Text(
                                      movie.popularity.toString(),
                                      style: TextStyle(fontSize: AppFontSize.s2, color: Colors.white),
                                    ),
                                    SizedBox(height: Scale.width(3)),
                                    Text(
                                      movie.voteCount.toString(),
                                      style: TextStyle(fontSize: AppFontSize.s2, color: Colors.white),
                                    ),
                                    SizedBox(height: Scale.width(3)),
                                    Text(
                                      movie.budget.toString(),
                                      style: TextStyle(fontSize: AppFontSize.s2, color: Colors.white),
                                    ),
                                    SizedBox(height: Scale.width(5)),
                                    Text(
                                      movie.voteAverage.toString(),
                                      style: TextStyle(fontSize: AppFontSize.s2, color: Colors.white),
                                    ),
                                  ]),
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
