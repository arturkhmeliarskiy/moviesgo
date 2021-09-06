import 'dart:async';
import 'dart:io';

import 'package:moviego_services/data_models/my_list.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("MY_LIST TABLE MY_LIST ("
          "id INTEGER PRIMARY KEY,"
          "title TEXT,"
          "posterpath TEXT,"
          "voteAverage NUMBER"
          ")");
    });
  }

  newClient(MyLists movie) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Client");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Client (id,first_name,last_name,blocked)"
        " VALUES (?,?,?,?)",
        [id, movie.title, movie.posterpath, movie.voteAverage]);
    return raw;
  }

  blockOrUnblock(MyLists movie) async {
    final db = await database;
    MyLists blocked = MyLists(
        id: movie.id,
        title: movie.title,
        posterpath: movie.posterpath,
        voteAverage: movie.voteAverage);
    var res = await db.update("Client", blocked.toMap(),
        where: "id = ?", whereArgs: [movie.id]);
    return res;
  }

  updateClient(MyLists newClient) async {
    final db = await database;
    var res = await db.update("Client", newClient.toMap(),
        where: "id = ?", whereArgs: [newClient.id]);
    return res;
  }

  getClient(int id) async {
    final db = await database;
    var res = await db.query("Client", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? MyLists.fromMap(res.first) : null;
  }

  Future<List<MyLists>> getBlockedClients() async {
    final db = await database;

    print("works");
    // var res = await db.rawQuery("SELECT * FROM Client WHERE blocked=1");
    var res = await db.query("Client", where: "blocked = ? ", whereArgs: [1]);

    List<MyLists> list =
        res.isNotEmpty ? res.map((c) => MyLists.fromMap(c)).toList() : [];
    return list;
  }

  Future<List<MyLists>> getAllClients() async {
    final db = await database;
    var res = await db.query("Client");
    List<MyLists> list =
        res.isNotEmpty ? res.map((c) => MyLists.fromMap(c)).toList() : [];
    return list;
  }

  deleteClient(int id) async {
    final db = await database;
    return db.delete("Client", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Client");
  }
}
