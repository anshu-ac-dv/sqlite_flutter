import 'package:flutter/material.dart';
import 'package:sqlite_flutter/DB%20Handler/db_handler.dart';
import 'package:sqlite_flutter/Models/models_classes.dart';
import 'package:sqlite_flutter/SQLite CURD/storage_list.dart';

class DynamicData extends StatelessWidget {
  DynamicData({super.key});

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Data"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter Name",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: ageController,
              decoration: InputDecoration(
                hintText: "Enter Age",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await DbHandler().insertData(
                  ModelsClasses(
                    name: nameController.text,
                    age: int.parse(ageController.text), // '20' => 20
                  ),
                );
                print("Data Inserted");
              },
              child: Text("Insert"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final data = await DbHandler().readData();
                print(data[15]);
              },
              child: Text("Read"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StorageList()),
          );
        },
        child: Icon(Icons.data_array),
      ),
    );
  }
}
