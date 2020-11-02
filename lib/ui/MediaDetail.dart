import 'package:flutter/material.dart';
import 'package:test_flutter/components/MovieTag.dart';
import 'package:test_flutter/data/Media.dart';
import 'package:test_flutter/data/Credit.dart';
import 'package:test_flutter/data/Genre.dart';
import 'package:test_flutter/api.dart';
import 'dart:convert';

class MediaDetailPage extends StatefulWidget {
  final Media media;
  MediaDetailPage({@required this.media});
  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<MediaDetailPage> {
  var credits = new List<Credit>();
  var actors = new List<String>();
  var genres = new List<Genre>();
  var types = new List<String>();

  _getMovieCast(id) {
    API.getMovieCast(id).then((response) {
      setState(() {
        var res = json.decode(response);
        Iterable list = res['cast'];
        credits = list.map((model) => Credit.fromJson(model)).toList();
        for (final actor in credits) {
          actors.add(actor.name);
        }
      });
    });
  }

  _getMovieGenres(id) {
    API.getMovieDetails(id).then((response) {
      setState(() {
        var res = json.decode(response);
        Iterable list = res['genres'];
        genres = list.map((model) => Genre.fromJson(model)).toList();
        for (final g in genres) {
          types.add(g.name);
        }
      });
    });
  }

  _getTVShowGenres(id) {
    API.getTVShowDetails(id).then((response) {
      setState(() {
        var res = json.decode(response);
        Iterable list = res['genres'];
        genres = list.map((model) => Genre.fromJson(model)).toList();
        for (final g in genres) {
          types.add(g.name);
        }
      });
    });
  }

  _getTVShowCast(id) {
    API.getTVShowCast(id).then((response) {
      setState(() {
        var res = json.decode(response);
        Iterable list = res['cast'];
        credits = list.map((model) => Credit.fromJson(model)).toList();
        for (final actor in credits) {
          actors.add(actor.name);
        }
      });
    });
  }

  _getData() {
    if (widget.media.title != null) {
      _getMovieCast(widget.media.id);
      _getMovieGenres(widget.media.id);
    } else {
      _getTVShowCast(widget.media.id);
      _getTVShowGenres(widget.media.id);
    }
  }

  initState() {
    super.initState();
    _getData();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverAppBar(
            brightness: Brightness.dark,
            pinned: true,
            // automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
            stretch: true,
            onStretchTrigger: () {
              // Function callback for stretch
              return;
            },
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              centerTitle: false,
              titlePadding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
              title: Text(
                widget.media.title == null
                    ? widget.media.name
                    : widget.media.title,
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    "https://image.tmdb.org/t/p/w1280/" +
                        widget.media.backdrop_path,
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.9),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Colors.black,
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.grey[850],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: "${widget.media.release_date}" + "  •  ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: (widget.media.release_date != null
                                    ? widget.media.release_date.substring(0, 4)
                                    : widget.media.first_air_date
                                        .substring(0, 4)) +
                                "  •  ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          WidgetSpan(
                            child: Icon(Icons.star,
                                size: 14, color: Colors.yellow),
                          ),
                          TextSpan(
                            text: "  ${widget.media.vote_average}  ",
                            style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    // Spacer()
                  ],
                ),
              ),
              Container(
                height: 70.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: types.length,
                    itemBuilder: (context, index) {
                      return MovieTag(movieTag: types[index]);
                    }),
              ),
              // Row(
              //   children: [
              //     MovieTag(movieTag: "Crime"),
              //     MovieTag(movieTag: "Drama"),
              //     MovieTag(movieTag: "Mystery"),
              //   ],
              // ),

              ListTile(
                title: RichText(
                  text: TextSpan(
                    text: 'Cast:  ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: actors.join(", "),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: RichText(
                  text: TextSpan(
                    text: 'Summary:  ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.media.overview,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
              // ListTiles++
            ]),
          ),
        ],
      ),
    );
  }
}
