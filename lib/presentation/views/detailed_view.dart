import 'package:desafio_tokenlab/models/post_model_comics.dart';
import 'package:flutter/material.dart';

class DetailedView extends StatefulWidget {
  final int movieId;

  const DetailedView({Key? key, required this.movieId}) : super(key: key);

  @override
  State<DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  late MovieData movie;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _loadArguments());
  }

  Future<void> _loadArguments() async {
    movie = await getMovieById(widget.movieId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        height: 300,
        child: Column(
          children: [
            Text(
              movie.title.toString() + "\n",
              style: TextStyle(fontSize: 12),
            ),
            Text(movie.voteCount.toString() + "\n", style: TextStyle(fontSize: 12)),
            Text(movie.imdbId! + "\n", style: TextStyle(fontSize: 12)),
            Text(movie.title! + "\n", style: TextStyle(fontSize: 12)),
            Text(movie.budget.toString() + "\n", style: TextStyle(fontSize: 12)),
            Text(movie.voteCount.toString() + "\n", style: TextStyle(fontSize: 12))
          ],
        ),
      ),
    );
  }
}
