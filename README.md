# SQLite Flutter

## Add Dependencies
>* Open your pubspec.yaml file and add sqflite for database operations and path provider to help locate the database file on the device.

## Create a database helper 
```dart
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

  insertData(String name, int age) async {
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

```

## Then Print that data in the console

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: const Text('Home'),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () async{
              await DbHandler().insertData('Anshu', 20);
              await DbHandler().insertData('Ansh', 20);
              final data = await DbHandler().readData();
              print(data);
            },
            child: Text("Insert"),
          ),
        ),
      ],
    ),
  );
}
```