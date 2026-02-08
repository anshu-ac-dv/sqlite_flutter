import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// This is the database helper class
class DbHandler {
  // This is the database instance
  Database? _database;
  // This is the database function
  Future<Database> database() async {
    if (_database != null) {
      return _database!;
    }
    // This is the path of the database
    Directory directory = await getApplicationDocumentsDirectory();
    // Creating a local phone storage for the database
    String path = join(directory.path, 'my_database.db');
    // Opening the database
    _database = await openDatabase(
      // Path of the database
      path,
      version: 1,
      // Creating a table in the database
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
    // Returning the database
    return _database!;
  }

  // Insert data into the database
  insertData(String name, int age) async {
    Database? db = await database();
    Map<String, dynamic> map = {'name': name, 'age': age};
    await db!.insert('DatabaseTable', map);
  }

  // Read data from the database
  readData() async {
    Database? db = await database();
    final list = await db!.query('DatabaseTable');
    return list;
  }

  // Delete data in the database
  deleteData(int id) async{
    Database? db = await database();
    await db!.delete('DatabaseTable', where: 'id = ?', whereArgs: [id]);
  }

  // Update data in the database
  updateData(String name, int age) async{
    Database? db = await database();

  }
}
