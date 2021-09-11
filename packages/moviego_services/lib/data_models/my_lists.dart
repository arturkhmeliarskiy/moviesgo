import 'dart:convert';

MyLists movieFromJson(String str) {
  final jsonData = json.decode(str);
  return MyLists.fromMap(jsonData);
}

String movieToJson(MyLists data) {
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
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        posterpath: json["posterpath"] ?? '',
        voteAverage: json['voteAverage'] ?? 0.0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "posterpath": posterpath,
        "voteAverage": voteAverage,
      };
}
