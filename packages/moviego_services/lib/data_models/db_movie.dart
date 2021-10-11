import 'dart:convert';

DBMovie movieFromJson(String str) {
  final jsonData = json.decode(str);
  return DBMovie.fromMap(jsonData);
}

String movieToJson(DBMovie data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class DBMovie {
  int id;
  String title;
  String posterpath;
  double voteAverage;

  DBMovie(
      {this.id = 0,
      this.title = '',
      this.posterpath = '',
      this.voteAverage = 0});

  factory DBMovie.fromMap(Map<String, dynamic> json) => DBMovie(
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
