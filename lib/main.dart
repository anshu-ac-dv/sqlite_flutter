import 'package:flutter/material.dart';
import 'package:sqlite_flutter/SQLite%20CURD/home_screen.dart';
import 'package:sqlite_flutter/SQLite%20CURD/dynamic_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      //home: HomeScreen(),
      home: DynamicData(),
    );
  }
}
