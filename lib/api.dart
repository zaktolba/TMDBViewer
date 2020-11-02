import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:test_flutter/data/Media.dart';

class API {
  static String _url = 'https://api.themoviedb.org/3/';
  static String _apiKey = '?api_key=0ad0db19297e36be5f72399ca99c0ebe';

  static Future getPopularMovies() async {
    String url = "https://api.themoviedb.org/3/movie/popular" + _apiKey;
    final res = await http.get(url);
    if (res.statusCode == 200) {
      return res.body;
    } else
      return "An error occurred";
  }

  static Future getPopularTVShows() async {
    String url = "https://api.themoviedb.org/3/tv/popular" + _apiKey;
    final res = await http.get(url);
    if (res.statusCode == 200) {
      return res.body;
    } else
      return "An error occurred";
  }

  static Future getMovieCast(id) async {
    String url = "https://api.themoviedb.org/3/movie/$id/credits" + _apiKey;
    final res = await http.get(url);
    if (res.statusCode == 200) {
      return res.body;
    } else
      return "An error occurred";
  }

  static Future getTVShowCast(id) async {
    String url = "https://api.themoviedb.org/3/tv/$id/credits" + _apiKey;
    final res = await http.get(url);
    if (res.statusCode == 200) {
      return res.body;
    } else
      return "An error occurred";
  }

  static Future getMovieDetails(id) async {
    String url = "https://api.themoviedb.org/3/movie/$id" + _apiKey;
    final res = await http.get(url);
    if (res.statusCode == 200) {
      return res.body;
    } else
      return "An error occurred";
  }

  static Future getTVShowDetails(id) async {
    String url = "https://api.themoviedb.org/3/tv/$id" + _apiKey;
    final res = await http.get(url);
    if (res.statusCode == 200) {
      return res.body;
    } else
      return "An error occurred";
  }

  static Future getBestMovies() async {
    String url = "https://api.themoviedb.org/3/movie/top_rated" + _apiKey;
    final res = await http.get(url);
    if (res.statusCode == 200) {
      return res.body;
    } else
      return "An error occurred";
  }
}
