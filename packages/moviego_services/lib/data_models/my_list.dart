import 'dart:convert';

MyLists clientFromJson(String str) {
  final jsonData = json.decode(str);
  return MyLists.fromMap(jsonData);
}

String clientToJson(MyLists data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class MyLists {
  int id;
  String title;
  String posterpath;
  double voteAverage;

  MyLists(
      {this.id = 0,
      this.title = '',
      this.posterpath = '',
      this.voteAverage = 0});

  factory MyLists.fromMap(Map<String, dynamic> json) => new MyLists(
        id: json["id"],
        title: json["title"],
        posterpath: json["poster_path"],
        voteAverage: json["vote_average"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "poster_path": posterpath,
        "vote_average": voteAverage,
      };
}
