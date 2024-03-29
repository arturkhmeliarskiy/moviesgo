import 'dart:async';
import 'dart:io';

import 'package:moviego_services/data_models/db_movie.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {
  static final DBProvider db = DBProvider();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE MY_LIST ("
          "id INTEGER PRIMARY KEY,"
          "title TEXT,"
          "posterpath TEXT,"
          "voteAverage DOUBLE"
          ")");
    });
  }

  addMovie(DBMovie movie) async {
    final db = await database;
    var raw = await db.rawInsert(
        "INSERT Into MY_LIST (id ,title ,posterpath ,voteAverage )"
        " VALUES (?,?,?,?)",
        [movie.id, movie.title, movie.posterpath, movie.voteAverage]);
    return raw;
  }

  blockOrUnblock(DBMovie movie) async {
    final db = await database;
    DBMovie blocked = DBMovie(
        id: movie.id,
        title: movie.title,
        posterpath: movie.posterpath,
        voteAverage: movie.voteAverage);
    var res = await db.update("MY_LIST", blocked.toMap(),
        where: "id = ?", whereArgs: [movie.id]);
    return res;
  }

  updateMovie(DBMovie movie) async {
    final db = await database;
    var res = await db.update("MY_LIST", movie.toMap(),
        where: "id = ?", whereArgs: [movie.id]);
    return res;
  }

  getMovie(int id) async {
    final db = await database;
    var res = await db.query("MY_LIST", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? DBMovie.fromMap(res.first) : null;
  }

  Future<List<DBMovie>> getAllMovie() async {
    final db = await database;
    var res = await db.query("MY_LIST");
    List<DBMovie> list =
        res.isNotEmpty ? res.map((c) => DBMovie.fromMap(c)).toList() : [];
    return list;
  }

  deleteMovie(int id) async {
    final db = await database;
    return db.delete("MY_LIST", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete FROM MY_LIST");
  }
}
