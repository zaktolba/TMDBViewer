import 'package:test_flutter/components/MoviePoster.dart';
import 'package:test_flutter/ui/MediaDetail.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/api.dart';
import 'package:test_flutter/data/Media.dart';
import 'package:test_flutter/ui/Login.dart';
import 'dart:convert';

bool _isLoggedIn = false;

class TMDBViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Movie DB',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: _isLoggedIn ? MediaList(title: 'TMDB Viewer') : LoginPage(),
      routes: {
        'login': (context) => LoginPage(),
        "home": (context) => MediaList(),
      },
    );
  }
}

class MediaList extends StatefulWidget {
  MediaList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MediaList> {
  var popularMovies = new List<Media>();
  var popularTVShows = new List<Media>();
  var bestMovies = new List<Media>();

  _getPopularMovies() {
    API.getPopularMovies().then((response) {
      setState(() {
        var res = json.decode(response);
        Iterable list = res['results'];
        popularMovies = list.map((model) => Media.fromJson(model)).toList();
      });
    });
  }

  _getPopularTVShows() {
    API.getPopularTVShows().then((response) {
      setState(() {
        var res = json.decode(response);
        Iterable list = res['results'];
        popularTVShows = list.map((model) => Media.fromJson(model)).toList();
      });
    });
  }

  _getBestMovies() {
    API.getBestMovies().then((response) {
      setState(() {
        var res = json.decode(response);
        Iterable list = res['results'];
        bestMovies = list.map((model) => Media.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getPopularMovies();
    _getPopularTVShows();
    _getBestMovies();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 40.0),
            Row(
              children: [
                SizedBox(width: 20.0),
                Text(
                  'Popular Movies',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Spacer()
              ],
            ),
            Container(
              height: 250.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8),
                  itemCount: popularMovies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (ctxt) => new MediaDetailPage(
                                    media: popularMovies[index])));
                      },
                      child: MoviePoster(
                          moviePosterURL: "https://image.tmdb.org/t/p/w1280/" +
                              popularMovies[index].poster_path),
                    );
                  }),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                SizedBox(width: 20.0),
                Text(
                  'Popular TV Shows',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Spacer()
              ],
            ),
            Container(
              height: 250.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8),
                  itemCount: popularTVShows.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (ctxt) => new MediaDetailPage(
                                    media: popularTVShows[index])));
                      },
                      child: MoviePoster(
                          moviePosterURL: "https://image.tmdb.org/t/p/w1280/" +
                              popularTVShows[index].poster_path),
                    );
                  }),
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                SizedBox(width: 20.0),
                Text(
                  'Best Movies',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Spacer()
              ],
            ),
            Container(
              height: 250.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8),
                  itemCount: bestMovies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (ctxt) => new MediaDetailPage(
                                    media: bestMovies[index])));
                      },
                      child: MoviePoster(
                          moviePosterURL: "https://image.tmdb.org/t/p/w1280/" +
                              bestMovies[index].poster_path),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
