import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_tokenlab/core/ui/colors.dart';
import 'package:desafio_tokenlab/core/ui/scale.dart';
import 'package:desafio_tokenlab/models/post_model_comics.dart';
import 'package:desafio_tokenlab/presentation/views/detailed_view.dart';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

import 'dart:convert';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  bool loading = true;
  List<Movie> movies = [];
  MovieData movie = MovieData(id: 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _loadArguments());
  }

  Future<void> _loadArguments() async {
    movies = await getMoviesList();
    movie = await getMovieById(movies[0].id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "HQs",
            icon: Icon(Icons.ac_unit_outlined),
          ),
          BottomNavigationBarItem(
            label: "Criadores",
            icon: Icon(Icons.ac_unit_sharp),
          ),
          BottomNavigationBarItem(
            label: "Personagens",
            icon: Icon(Icons.ac_unit_outlined),
          ),
        ],
      ),
      appBar: RoundedPrimaryAppBar(isHome: true),
      body: Container(
        color: Color.fromRGBO(40, 40, 40, 1),
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailedView(
                                  movieId: movies[index].id!,
                                )),
                      )
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration:
                          BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.all(Radius.circular(20))),
                      alignment: Alignment.center,
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            trailing: Container(
                              width: 40,
                              child: CachedNetworkImage(
                                errorWidget: (context, url, error) => Icon(Icons.error),
                                imageUrl: movies[index].posterUrl.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                            leading: CircleAvatar(child: Text(movies[index].voteAverage.toString())),
                            title: Text(
                              movies[index].title.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                                "Release date: " +
                                    movies[index].releaseDate.toString() +
                                    "\nGenres: " +
                                    movies[index].genres!.join(", "),
                                style: TextStyle(color: Colors.white)),
                          ),
                          StarsCount(voteAverage: movies[index].voteAverage!)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class StarsCount extends StatelessWidget {
  final double voteAverage;

  StarsCount({Key? key, required this.voteAverage}) : super(key: key);

  final filledStars = Icon(Icons.star_rate, size: 12, color: Colors.yellow);
  final unfilledStars = Icon(Icons.star_outline, size: 12);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 0; i < 5; i++)
            if (i * 2 < voteAverage) filledStars else unfilledStars
        ],
      ),
    );
  }
}

class RoundedPrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double fontSize;
  final bool isHome;
  final double height;

  const RoundedPrimaryAppBar({
    Key? key,
    this.fontSize = 18,
    this.isHome = false,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isHome == true ? null : const BackButton(color: AppColors.rollingStone),
      toolbarHeight: Scale.width(20),
      shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.brVerticalBot8),
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        "MOVIES",
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.rollingStone, fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * height);
}
