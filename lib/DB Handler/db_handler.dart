import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHandler {
  Database? _database;
  Future<Database> database() async {
    if (_database != null) {
      return _database!;
    }
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'my_database.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE DatabaseTable(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        age INTEGER
        )
        ''');
      },
    );
    return _database!;
  }

  insertData(int id, String name, int age) async {
    Database? db = await database();
    Map<String, dynamic> map = {'name': name, 'age': age};
    await db!.insert('DatabaseTable', map);
  }

  readData() async {
    Database? db = await database();
    final list = await db!.query('DatabaseTable');
    return list;
  }
}
