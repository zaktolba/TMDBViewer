import 'package:flutter/material.dart';
import 'package:test_flutter/ui/MediaDetail.dart';

class MoviePoster extends StatelessWidget {
  final String moviePosterURL;
  MoviePoster({@required this.moviePosterURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.all(10.0),
      width: 130.0,
      height: 200.0,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(moviePosterURL),
            fit: BoxFit.cover,
          ),
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(8.0)),
    );
  }
}
