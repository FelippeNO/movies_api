import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_tokenlab/core/ui/colors.dart';
import 'package:desafio_tokenlab/core/ui/scale.dart';
import 'package:desafio_tokenlab/domain/entities/movie_data_entity.dart';
import 'package:desafio_tokenlab/domain/entities/movies_entity.dart';
import 'package:desafio_tokenlab/presentation/controllers/core_controller.dart';
import 'package:desafio_tokenlab/presentation/views/detailed_view.dart';
import 'package:desafio_tokenlab/presentation/widgets/rounded_primary_app_bar.dart';
import 'package:desafio_tokenlab/presentation/widgets/stars_count_widget.dart';
import "package:flutter/material.dart";

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
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
        isHome: true,
        fontSize: AppFontSize.appBarTitleH1,
      ),
      body: ValueListenableBuilder(
          valueListenable: coreController.moviesLoading,
          builder: (context, value, _) {
            bool isLoading = coreController.moviesLoading.value;
            return Container(
              color: Colors.black,
              child: isLoading == true
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: EdgeInsets.only(top: Scale.width(2)),
                      child: ValueListenableBuilder(
                          valueListenable: CoreController.movies,
                          builder: (context, value, _) {
                            List<MovieEntity> value = CoreController.movies.value;
                            return ListView.builder(
                              itemCount: value.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.all(Scale.width(2)),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () => {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DetailedView(
                                                movieId: value[index].id!,
                                              ),
                                            ),
                                          )
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(Scale.width(2)),
                                          decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.1),
                                              borderRadius: BorderRadius.all(Radius.circular(Scale.width(5)))),
                                          alignment: Alignment.center,
                                          height: Scale.width(29),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              ListTile(
                                                trailing: SizedBox(
                                                  width: Scale.width(10),
                                                  child: CachedNetworkImage(
                                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                                    imageUrl: value[index].posterUrl.toString(),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                leading: CircleAvatar(child: Text(value[index].voteAverage.toString())),
                                                title: Text(
                                                  value[index].title.toString(),
                                                  style: TextStyle(color: Colors.white, fontSize: AppFontSize.s1),
                                                ),
                                                subtitle: Padding(
                                                  padding: EdgeInsets.only(top: Scale.width(1)),
                                                  child: Text(
                                                      "Release date: " +
                                                          value[index].releaseDate.toString() +
                                                          "\nGenres: " +
                                                          value[index].genres!.join(", "),
                                                      style: TextStyle(color: Colors.white, fontSize: AppFontSize.s3)),
                                                ),
                                              ),
                                              StarsCount(voteAverage: CoreController.movies.value[index].voteAverage!)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }),
                    ),
            );
          }),
    );
  }
}
