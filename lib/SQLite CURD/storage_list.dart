import 'package:flutter/material.dart';
import 'package:sqlite_flutter/DB%20Handler/db_handler.dart';
import 'package:sqlite_flutter/Models/models_classes.dart';

class StorageList extends StatefulWidget {
  const StorageList({super.key});

  @override
  State<StorageList> createState() => _StorageListState();
}

class _StorageListState extends State<StorageList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Storage List"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // 1. Use Expanded so the ListView knows how much height to take
          Expanded(
            child: FutureBuilder<List<ModelsClasses>>(
              future: DbHandler().readData(),
              builder: (context, snapshot) {
                // 2. Handle the loading state
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                // 3. Handle errors
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      // 4. Access properties directly from the Model object
                      final item = snapshot.data![index];
                      return ListTile(
                        title: Text(item.name ?? "No Name"), // Adjust based on your Model fields
                        subtitle: Text(item.age?.toString() ?? "0"),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No data found"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}