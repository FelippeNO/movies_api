import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_tokenlab/models/post_model_comics.dart';

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
    movies = await pegarJson();
    movie = await pegarMovieData(movies[0].id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      appBar: AppBar(
        title: Text("Marvel"),
      ),
      body: Container(
        color: Color.fromRGBO(40, 40, 40, 1),
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // CachedNetworkImage(imageUrl: movies[index].posterUrl.toString()),
                  ListTile(
                    title: Text(
                      movies[index].id.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(movie.overview.toString()),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
