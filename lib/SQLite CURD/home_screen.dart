import 'package:flutter/material.dart';
import 'package:sqlite_flutter/DB%20Handler/db_handler.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          // This is the button for inserting data into the database
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent, // Button color
                shadowColor: Colors.blueGrey,      // Shadow color
                elevation: 5,                        // Elevation
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async{
                await DbHandler().insertData('Anshu', 20);
              },
              child: Text("Insert"),
            ),
          ),
          SizedBox(height: 20,),
          // This is the button for reading data from the database
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent, // Button color
                shadowColor: Colors.blueGrey,      // Shadow color
                elevation: 5,                        // Elevation
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async{
                await DbHandler().insertData('Anshu', 20);
                final data = await DbHandler().readData();
                print(data);
              },
              child: Text("Read"),
            ),
          ),
          // This is the button for deleting data from the database
          SizedBox(height: 20,),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent, // Button color
                shadowColor: Colors.blueGrey,      // Shadow color
                elevation: 5,                        // Elevation
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async{
                await DbHandler().deleteData(20);
                print("Data Deleted");
              },
              child: Text("Delete"),
            ),
          ),
          SizedBox(height: 20,),
          // This is the button for deleting data from the database
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent, // Button color
                shadowColor: Colors.blueGrey,      // Shadow color
                elevation: 5,                        // Elevation
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async{
                await DbHandler().deleteData(20);
                print("Data Updated");
              },
              child: Text("Update"),
            ),
          ),
        ],
      ),
    );
  }
}
