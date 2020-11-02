class Genre {
  int id;
  String name;

  Genre(int id, String name) {
    this.id = id;
    this.name = name;
  }

  Genre.fromJson(Map json)
      : id = json['id'],
        name = json['name'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
