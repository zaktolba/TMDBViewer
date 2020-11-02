class Credit {
  int id;
  String name;

  Credit(int id, String name) {
    this.id = id;
    this.name = name;
  }

  Credit.fromJson(Map json)
      : id = json['id'],
        name = json['name'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
