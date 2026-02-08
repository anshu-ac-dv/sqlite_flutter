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
}
