import 'package:flutter/material.dart';
import 'package:lodjinha/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterLodjinha',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Color.fromARGB(255, 94, 42, 132)
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
