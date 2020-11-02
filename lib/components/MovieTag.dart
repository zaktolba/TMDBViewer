import 'package:flutter/material.dart';

class MovieTag extends StatelessWidget {
  final String movieTag;
  MovieTag({@required this.movieTag});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Text(
          movieTag,
          style: TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
    );
  }
}
