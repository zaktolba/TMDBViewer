class Media {
  int id;
  String title;
  String name;
  dynamic vote_average;
  String poster_path;
  String overview;
  String backdrop_path;
  String release_date;
  String first_air_date;

  Media(
      int id,
      String title,
      String name,
      dynamic vote_average,
      String poster_path,
      String overview,
      String backdrop_path,
      String release_date,
      String first_air_date) {
    this.id = id;
    this.title = title;
    this.name = title;
    this.vote_average = vote_average;
    this.poster_path = poster_path;
    this.overview = overview;
    this.backdrop_path = backdrop_path;
    this.release_date = release_date;
    this.first_air_date = first_air_date;
  }

  Media.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        name = json['name'],
        vote_average = json['vote_average'],
        poster_path = json['poster_path'],
        overview = json['overview'],
        backdrop_path = json['backdrop_path'],
        release_date = json['release_date'],
        first_air_date = json['first_air_date'];

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'name': name,
      'vote_average': vote_average,
      'poster_path': poster_path,
      'overview': overview,
      'backdrop_path': backdrop_path,
      'release_date': release_date,
      'first_air_date': first_air_date
    };
  }
}
